require 'logger'

module Maksekeskus
  class Cli
    def initialize(cfg_params = {})
      cfg_params.each { |key, value| config.public_send("#{key}=", value) }
    end

    def config
      @config ||= Config.new
    end

    def connection
      @connection ||= Connection.new(config)
    end

    def mac(json = {})
      Mac.new(config, json)
    end

    def shop
      @shop ||= Resource::Shop.new(connection)
    end

    def transaction
      @transaction ||= Resource::Transaction.new(connection)
    end
  end
end
