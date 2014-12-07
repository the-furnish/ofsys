require 'spec_helper'

describe Ofsys::Request::ContactsDelete do
  include ConfigureHelper
  before(:each) { configure_defaults }

  let(:data) do
    {
      Clause: {
        :'$type' => 'FieldClause',
        Field: {
          Name: 'f_EMail'
        },
        TypeOperator: 'Equal',
        ComparisonValue: 'aishek@gmail.com'
      },
      MaxRows: 1
    }
  end

  let(:result) do
    {
      'Success' => true,
      'ErrorCode' => nil,
      'ErrorMessage' => nil,
      'DeletedRecords' => 1,
      'idRequest' => 18946891,
      'Trace' => "Beginning request (04:26:51)\r\n\tchecking OFSYS User authentication: False\r\n\tchecking Dialog Insight administrator: False\r\nTargeted service: Contacts.Delete\r\nDeserializing JSON...\r\nDeserializing JSON completed\r\nValidating parameters...\r\nValidating parameterscompleted with success\r\nExecuting method...\r\nExecuting method completed with success"
    }
  end

  it 'performs correct request with passed data' do
    VCR.use_cassette('contacts_delete') do
      expect(described_class.new.perform(data)).to eq(result)
    end
  end
end
