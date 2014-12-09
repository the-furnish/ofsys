require 'spec_helper'

describe Ofsys::Request::ContactsMerge do
  include ConfigureHelper
  before(:each) { configure_defaults }

  let(:data) do
    {
      Records: [
        {
          ID: {
            key_f_EMail: 'user@example.com'
          },
          Data: {
            f_EMail: 'user@example.com'
          }
        }
      ],
      MergeOptions: {
        AllowInsert: true,
        AllowUpdate: true,
        SkipDuplicateRecords: false,
        SkipUnmatchedRecords: false,
        ReturnRecordsOnSuccess: false,
        ReturnRecordsOnError: false,
        FieldOptions: nil
      }
    }
  end

  let(:result) do
    {
      'Success' => true,
      'ErrorCode' => nil,
      'ErrorMessage' => nil,
      'CreatedRecords' => 0,
      'UpdatedRecords' => 1,
      'Records' => [
        {
          'Status' => 'Updated',
          'ValidationResult' => 'OK',
          'Message' => nil,
          'ID' => {
            'key_f_EMail' => 'user@example.com'
          },
          'Data' => nil,
          'Record' => nil
        }
      ]
    }
  end

  it 'performs correct request with passed data' do
    VCR.use_cassette('contacts_merge') do
      expect(described_class.new.perform(data)).to eq(result)
    end
  end
end
