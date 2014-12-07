require 'spec_helper'

describe Ofsys::Request::ContactsMerge do
  include ConfigureHelper
  before(:each) { configure_defaults }

  let(:data) do
    {
      Records: [
        {
          ID: {
            key_f_EMail: 'aishek@gmail.com'
          },
          Data: {
            f_EMail: 'aishek@gmail.com'
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
          'IdRecord' => 15,
          'Status' => 'Updated',
          'ValidationResult' => 'OK',
          'Message' => nil,
          'ID' => {
            'key_f_EMail' => 'aishek@gmail.com'
          },
          'Data' => nil,
          'Record' => nil
        }
      ],
      'idRequest' => 18945355,
      'Trace' => "Beginning request (04:15:25)\r\n\tchecking OFSYS User authentication: False\r\n\tchecking Dialog Insight administrator: False\r\nTargeted service: Contacts.Merge\r\nDeserializing JSON...\r\nDeserializing JSON completed\r\nValidating parameters...\r\nRecords count: 1\r\nRecords candidates for insert: 1\r\nRecords candidates for update: 1\r\nValidating parameterscompleted with success\r\nExecuting method...\r\n\tRecords bulked: 1\r\n\tRecords matched by PK: 1\r\n\tRecords dupes, source versus source: 0\r\n\tRecords dupes, source versus target: 0\r\n\tRecords updated: 1\r\n\tRecords created: 0\r\n\tEMails changed: 0\r\n\tOptins field changed: no flag involved\r\nExecuting method completed with success"
    }
  end

  it 'performs correct request with passed data' do
    VCR.use_cassette('contacts_merge') do
      expect(described_class.new.perform(data)).to eq(result)
    end
  end
end
