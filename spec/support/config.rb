require 'dotenv'
require 'logger'

Dotenv.load

Maksekeskus::Config.url = ENV.fetch('URL')
Maksekeskus::Config.shop_id = ENV.fetch('SHOP_ID')
Maksekeskus::Config.api_key = ENV.fetch('API_KEY')
Maksekeskus::Config.secret_key = ENV.fetch('SECRET_KEY')
Maksekeskus::Config.logger = Logger.new(File.join($ROOT_PATH, 'log', 'test.log'))
