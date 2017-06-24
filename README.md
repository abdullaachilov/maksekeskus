# Maksekeskus

[![Build Status](https://semaphoreci.com/api/v1/shlima/maksekeskus/branches/master/badge.svg)](https://semaphoreci.com/shlima/maksekeskus)

## Configuration

```ruby
Maksekeskus::Config.url = ENV.fetch('URL')
Maksekeskus::Config.shop_id = ENV.fetch('SHOP_ID')
Maksekeskus::Config.api_key = ENV.fetch('API_KEY')
Maksekeskus::Config.secret_key = ENV.fetch('SECRET_KEY')
Maksekeskus::Config.logger = Logger.new(STDOUT)
````

You may override configuration params localy: 

```ruby
Maksekeskus::Cli.new(url: 'https://api-test.maksekeskus.ee/v1/')
```

## Shop

```ruby
cli = Maksekeskus::Cli.new
cli.shop.info.json
cli.shop.configuration.json
cli.shop.accountstatements(since: '2017-08-09').json
cli.shop.fees(since: '2017-07-09').json
````

## Transaction

```ruby
cli = Maksekeskus::Cli.new
cli.transaction.create(transaction: {amount: 5, currency: 'EUR', reference: '123abc'}, customer: {email: 'cusotmer@exaomle.com', ip: '80.235.22.114'}).json
cli.transaction.get('a6182c9f-d7e6-4420-8706-acbc3179f137').json
cli.transaction.list(since: '2017-08-09').json
````

## Validating the response

```ruby
cli = Maksekeskus::Cli.new
mac = cli.mac({"shop":"f7741ab2-7445-45f9-9af4-0d0408ef1e4c","amount":"12.95","reference":"123abc","country":"ee","locale":"et"})
mac.composed #=> "F7A5FC0AF516FE4F48E61290CF8F47909D348FC8878CE5B003E7A104DFB38FD4E24E5EE5668057CC9495320432F20528FFE040FCC75617B574D0E40443C1EF00"
```
