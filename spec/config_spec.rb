require 'spec_helper'

describe Ofsys do
  context 'known keys' do
    it 'assigns config variables' do
      described_class.configure do |config|
        config.id_key = 'key1'
        config.key = 'key2'
        config.id_project = 'key3'
      end

      expect(described_class.config.id_key).to eq('key1')
      expect(described_class.config.key).to eq('key2')
      expect(described_class.config.id_project).to eq('key3')
    end
  end

  context 'unknown key' do
    subject do
      described_class.configure do |config|
        config.unknown_key = 'key1'
      end
    end

    it 'raise error' do
      expect { subject }.to raise_error(NoMethodError)
    end
  end
end
