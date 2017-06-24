require 'json'
require 'digest'

# @ref https://developer.maksekeskus.ee//reference.php
module Maksekeskus
  class Mac
    attr_reader :config
    attr_accessor :json

    def initialize(config, json = nil)
      @config = config
      @json = json
    end

    # UPPERCASE(HEX(SHA-512(string(JSON) + string(Secret Key))))
    def composed
      Digest::SHA512.hexdigest(json.to_json + config.secret_key!).upcase
    end
  end
end
