require 'json'
require 'addressable/uri'
require 'faraday'
require 'faraday/encoding'
require 'faraday_middleware'

module Maksekeskus
  class Connection
    attr_reader :config

    def initialize(config = Config)
      @config = config
    end

    def transport
      @transport ||= Faraday.new(headers: headers) do |conn|
        conn.use Faraday::Request::UrlEncoded
        conn.use Faraday::Response::RaiseError
        conn.use Faraday::Encoding
        conn.use Faraday::Response::Logger, config.logger
        conn.adapter Faraday.default_adapter
      end
    end

    def headers
      @headers ||= {
        'User-Agent' => 'Maksekeskus Ruby API',
        'Content-Type' => 'application/json'
      }
    end

    # @proxy
    def get(path, query = {})
      transport.get(uri(path), query)
    end

    # @proxy
    def post(path, body = {})
      transport.post(uri(path), body.to_json)
    end

    def auth_level_1
      clone.tap do |dolly|
        dolly.transport.basic_auth(config.shop_id!, config.api_key!)
        return yield(dolly)
      end
    end

    def auth_level_2
      clone.tap do |dolly|
        dolly.transport.basic_auth(config.shop_id!, config.secret_key!)
        return yield(dolly)
      end
    end

    # @param [String]
    def uri(address)
      uri = Addressable::URI.parse(address)
      uri.relative? ? Addressable::URI.parse(config.url!) + uri : uri
    end
  end
end
