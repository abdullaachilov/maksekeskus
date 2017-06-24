RSpec.describe Maksekeskus::Config do
  describe Maksekeskus::Cli do
    subject do
      described_class.new(url: 'http://example.com')
    end

    it 'does not override global config' do
      expect { subject }.not_to change { Maksekeskus::Config.url }
    end

    it 'override instance config' do
      expect(subject.config.url).to eq('http://example.com')
      expect(described_class.new.config.url).not_to eq('http://example.com')
    end
  end

  stub = Class.new(Maksekeskus::Config) do
    conf_accessor :foo
  end

  describe stub do
    it 'raises an error if value not exists' do
      expect(subject.foo).to eq(nil)
      expect { subject.foo! }.to raise_error(Maksekeskus::ConfigurationError)
    end
  end
end
