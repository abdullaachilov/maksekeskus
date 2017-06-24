require 'maksekeskus/version'
require 'maksekeskus/error'

module Maksekeskus
  autoload :Config, 'maksekeskus/config'
  autoload :Cli, 'maksekeskus/cli'
  autoload :Connection, 'maksekeskus/connection'
  autoload :SiteResponse, 'maksekeskus/site_response'
  autoload :Mac, 'maksekeskus/mac'

  module Resource
    autoload :Base, 'maksekeskus/resource/base'
    autoload :Shop, 'maksekeskus/resource/shop'
    autoload :Transaction, 'maksekeskus/resource/transaction'
  end
end
