RSpec.describe Maksekeskus::Resource::Shop, vcr: {cassette_name: 'shop'} do
  subject do
    Maksekeskus::Cli.new.shop
  end

  describe '#info' do
    let(:expectation) do
      {
        "contact" => {"email" => "maksekeskus.test@mailinator.com", "phone" => "123456789"},
        "created_at" => "2014-06-02T13:26:21+0000",
        "id" => "f7741ab2-7445-45f9-9af4-0d0408ef1e4c",
        "modified_at" => "2017-08-09T00:00:01+0000",
        "name" => "maksekeskus.ee/test 1234567890",
        "notifications" => {"email" => nil, "method" => "GET", "url" => nil},
        "object" => "shop",
        "return" => {"method" => "POST", "url" => "https://portal.beehosting.pro/modules/gateways/callback/mk_bankcard_result.php"},
        "status" => "ACTIVE"
      }
    end

    it { expect(subject.info.json).to eq(expectation) }
  end

  describe '#configuration' do
    let(:expectation) do
      ["contact", "created_at", "features", "id", "modified_at", "name", "notifications", "object", "paymentMethods", "payment_methods", "return", "status"]
    end

    it { expect(subject.configuration.json.keys).to eq(expectation) }
  end

  describe '#accountstatements' do
    it { expect(subject.accountstatements(since: '2017-08-09').json.count).to eq(6) }
  end

  describe '#fees' do
    let(:expectation) do
      [
        {"object" => "accounting", "amount" => -10.0, "vat" => -2.0, "id" => "cd792d4d-94f3-4913-80ae-011bacfe81da", "created_at" => "2017-07-31T02:00:28+0000"},
        {"object" => "accounting", "amount" => -10.0, "vat" => -2.0, "id" => "b14958fa-3a3f-4e17-b6b5-538fb1d21b95", "created_at" => "2017-07-31T20:59:59+0000"}
      ]
    end

    it { expect(subject.fees(since: '2017-07-09').json).to eq(expectation) }
  end
end
