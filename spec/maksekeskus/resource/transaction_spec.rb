RSpec.describe Maksekeskus::Resource::Transaction, vcr: {cassette_name: 'transaction'} do
  subject do
    Maksekeskus::Cli.new.transaction
  end

  describe '#create' do
    let(:expectation) do
      {"_links"=>
           {"Pay"=>{"href"=>"https://api-test.maksekeskus.ee/v1/transactions/a6182c9f-d7e6-4420-8706-acbc3179f137/payments"},
            "self"=>{"href"=>"https://api-test.maksekeskus.ee/v1/transactions/a6182c9f-d7e6-4420-8706-acbc3179f137"}},
       "amount"=>5.0,
       "country"=>nil,
       "created_at"=>"2017-08-09T16:54:12+0000",
       "currency"=>"EUR",
       "customer"=>
           {"created_at"=>"2017-08-09T16:54:12+0000",
            "email"=>"cusotmer@exaomle.com",
            "id"=>"b6355af6-e74b-4e8c-9604-2b7cb014dbec",
            "ip"=>"80.235.22.114",
            "ip_country"=>"ee",
            "name"=>"b6355af6-e74b-4e8c-9604-2b7cb014dbec",
            "object"=>"customer"},
       "id"=>"a6182c9f-d7e6-4420-8706-acbc3179f137",
       "method"=>nil,
       "object"=>"transaction",
       "payment_methods"=>
           {"banklinks"=>
                [{"country"=>"ee", "name"=>"swedbank", "url"=>"https://payment-test.maksekeskus.ee/banklink.html?method=EE_SWED&trx=a6182c9f-d7e6-4420-8706-acbc3179f137"},
                 {"country"=>"ee", "name"=>"seb", "url"=>"https://payment-test.maksekeskus.ee/banklink.html?method=EE_SEB&trx=a6182c9f-d7e6-4420-8706-acbc3179f137"},
                 {"country"=>"ee", "name"=>"lhv", "url"=>"https://payment-test.maksekeskus.ee/banklink.html?method=EE_LHV&trx=a6182c9f-d7e6-4420-8706-acbc3179f137"},
                 {"country"=>"ee", "name"=>"nordea", "url"=>"https://payment-test.maksekeskus.ee/banklink.html?method=EE_NORDEA&trx=a6182c9f-d7e6-4420-8706-acbc3179f137"},
                 {"country"=>"ee", "name"=>"danske", "url"=>"https://payment-test.maksekeskus.ee/banklink.html?method=EE_DANSKE&trx=a6182c9f-d7e6-4420-8706-acbc3179f137"},
                 {"country"=>"ee", "name"=>"krediidipank", "url"=>"https://payment-test.maksekeskus.ee/banklink.html?method=EE_KREDIIDI&trx=a6182c9f-d7e6-4420-8706-acbc3179f137"},
                 {"country"=>"ee", "name"=>"pocopay", "url"=>"https://payment-test.maksekeskus.ee/banklink.html?method=EE_POCOPAY&trx=a6182c9f-d7e6-4420-8706-acbc3179f137"},
                 {"country"=>"ee", "name"=>"liisi_ee", "url"=>"https://payment-test.maksekeskus.ee/banklink.html?method=EE_LIISI_EE&trx=a6182c9f-d7e6-4420-8706-acbc3179f137"},
                 {"country"=>"lv", "name"=>"seb", "url"=>"https://payment-test.maksekeskus.ee/banklink.html?method=LV_SEB&trx=a6182c9f-d7e6-4420-8706-acbc3179f137"},
                 {"country"=>"lv", "name"=>"nordea", "url"=>"https://payment-test.maksekeskus.ee/banklink.html?method=LV_NORDEA&trx=a6182c9f-d7e6-4420-8706-acbc3179f137"},
                 {"country"=>"lv", "name"=>"citadele", "url"=>"https://payment-test.maksekeskus.ee/banklink.html?method=LV_CITADELE&trx=a6182c9f-d7e6-4420-8706-acbc3179f137"},
                 {"country"=>"lt", "name"=>"seb", "url"=>"https://payment-test.maksekeskus.ee/banklink.html?method=LT_SEB&trx=a6182c9f-d7e6-4420-8706-acbc3179f137"},
                 {"country"=>"lt", "name"=>"nordea", "url"=>"https://payment-test.maksekeskus.ee/banklink.html?method=LT_NORDEA&trx=a6182c9f-d7e6-4420-8706-acbc3179f137"},
                 {"country"=>"fi",
                  "name"=>"nordea",
                  "url"=>"https://payment-test.maksekeskus.ee/banklink.html?method=FI_PAYTRAIL_NORDEA&trx=a6182c9f-d7e6-4420-8706-acbc3179f137"},
                 {"country"=>"fi",
                  "name"=>"danske",
                  "url"=>"https://payment-test.maksekeskus.ee/banklink.html?method=FI_PAYTRAIL_DANSKE&trx=a6182c9f-d7e6-4420-8706-acbc3179f137"},
                 {"country"=>"fi",
                  "name"=>"pohjola",
                  "url"=>"https://payment-test.maksekeskus.ee/banklink.html?method=FI_PAYTRAIL_POHJOLA&trx=a6182c9f-d7e6-4420-8706-acbc3179f137"},
                 {"country"=>"fi",
                  "name"=>"alandsbanken",
                  "url"=>"https://payment-test.maksekeskus.ee/banklink.html?method=FI_PAYTRAIL_ALANDSBANKEN&trx=a6182c9f-d7e6-4420-8706-acbc3179f137"},
                 {"country"=>"fi",
                  "name"=>"handelsbanken",
                  "url"=>"https://payment-test.maksekeskus.ee/banklink.html?method=FI_PAYTRAIL_HANDELSBANKEN&trx=a6182c9f-d7e6-4420-8706-acbc3179f137"},
                 {"country"=>"fi",
                  "name"=>"spankki",
                  "url"=>"https://payment-test.maksekeskus.ee/banklink.html?method=FI_PAYTRAIL_SPANKKI&trx=a6182c9f-d7e6-4420-8706-acbc3179f137"}],
            "cards"=>[{"name"=>"visa"}, {"name"=>"mastercard"}, {"name"=>"maestro"}],
            "cash"=>[],
            "other"=>[{"name"=>"redirect", "url"=>"https://payment-test.maksekeskus.ee/pay.html?trx=a6182c9f-d7e6-4420-8706-acbc3179f137"}]},
       "recurring_required"=>false,
       "reference"=>"123abc",
       "status"=>"CREATED",
       "type"=>nil}
    end

    let(:params) do
      {
        transaction: {amount: 5, currency: 'EUR', reference: '123abc'},
        customer: {email: 'cusotmer@exaomle.com', ip: '80.235.22.114'}
      }
    end

    it { expect(subject.create(params).json).to eq(expectation) }
  end

  describe '#get' do
    let(:expectation) do
      {"_links"=>{"self"=>{"href"=>"https://api-test.maksekeskus.ee/v1/transactions/a6182c9f-d7e6-4420-8706-acbc3179f137"}},
       "amount"=>5.0,
       "country"=>nil,
       "created_at"=>"2017-08-09T16:54:12+0000",
       "currency"=>"EUR",
       "customer"=>
           {"created_at"=>"2017-08-09T16:54:12+0000",
            "email"=>"cusotmer@exaomle.com",
            "id"=>"b6355af6-e74b-4e8c-9604-2b7cb014dbec",
            "ip"=>"80.235.22.114",
            "ip_country"=>"ee",
            "name"=>"b6355af6-e74b-4e8c-9604-2b7cb014dbec",
            "object"=>"customer"},
       "id"=>"a6182c9f-d7e6-4420-8706-acbc3179f137",
       "method"=>nil,
       "object"=>"transaction",
       "recurring_required"=>false,
       "reference"=>"123abc",
       "status"=>"CREATED",
       "type"=>nil}
    end

    it { expect(subject.get('a6182c9f-d7e6-4420-8706-acbc3179f137').json).to eq(expectation) }
  end

  describe '#list' do
    let(:expectation) do
      {"amount"=>0.5,
       "currency"=>"EUR",
       "object"=>"transaction",
       "status"=>"COMPLETED",
       "reference"=>"50",
       "customer"=>
           {"object"=>"customer",
            "locale"=>"ru",
            "country"=>"ee",
            "ip"=>"46.39.158.61",
            "name"=>"Tõõger Leõpäöld",
            "links"=>[],
            "id"=>"7998a335-a8f5-4284-a03d-d4a2e7e15a51",
            "created_at"=>"2017-08-09T13:23:38+0000",
            "ip_country"=>"ee"},
       "type"=>"banklink",
       "method"=>"seb",
       "country"=>"ee",
       "links"=>[{"rel"=>"self", "href"=>"https://api-test.maksekeskus.ee/v1/transactions/1c44003e-5b77-44f5-b75a-a263026aa290"}],
       "id"=>"1c44003e-5b77-44f5-b75a-a263026aa290",
       "created_at"=>"2017-08-09T13:23:38+0000",
       "completed_at"=>"2017-08-09T13:23:42+0000",
       "refunded_amount"=>0.0,
       "refunded_original_amount"=>0.0,
       "fees"=>0.31,
       "fees_vat"=>0.06,
       "net_amount"=>0.13,
       "banklink"=>
           {"object"=>"banklink",
            "iban"=>"EE171010123456789017",
            "description"=>"Maksekeskus AS, maksekeskus.ee/test 1234567890, 50 (131431)",
            "created_at"=>"2017-08-09T13:23:43+0000"},
       "recurring_required"=>false}
    end

    it { expect(subject.list(since: '2017-08-09').json.count).to eq(12) }
    it { expect(subject.list(since: '2017-08-09').json.first).to eq(expectation) }
  end
end
