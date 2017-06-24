RSpec.describe Maksekeskus::Mac do
  subject do
    Maksekeskus::Cli.new.mac(json)
  end

  describe '#composed' do
    let(:json) do
      {"shop":"f7741ab2-7445-45f9-9af4-0d0408ef1e4c","amount":"12.95","reference":"123abc","country":"ee","locale":"et"}
    end

    let(:expectation) do
      'F7A5FC0AF516FE4F48E61290CF8F47909D348FC8878CE5B003E7A104DFB38FD4E24E5EE5668057CC9495320432F20528FFE040FCC75617B574D0E40443C1EF00'
    end

    it { expect(subject.composed).to eq(expectation) }
  end
end
