require 'json'

module Maksekeskus
  class SiteResponse
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def body
      response.body
    end

    def inspect
      json
    end

    def json
      @json ||= JSON.parse(body)
    end

    def [](key)
      json[key]
    end
  end
end
