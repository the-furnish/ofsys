require 'spec_helper'

describe Ofsys::Request::SendingsSendSingle do
  include ConfigureHelper
  before(:each) { configure_defaults }

  let(:data) do
    {
      idMessage: 538731,
      contactFilter: {
        Mode: 'Clauses',
        TableClauses: [
          {
            TableCode: 'Contact',
            Clause: {
              :'$type' => 'FieldClause',
              Field: {
                TableCode: 'Contact',
                Name: 'f_EMail'
              },
              TypeOperator: 'Equal',
              ComparisonValue: 'ab+45@cifronomika.ru'
            }
          }
        ]
      }
    }
  end

  let(:result) do
    {
      'Success' => true,
      'ErrorCode' => nil,
      'ErrorMessage' => nil,
      'AffectedContacts' => 1,
      'idRequest' => 18947426,
      'Trace' => "Beginning request (04:30:24)\r\n\tchecking OFSYS User authentication: False\r\n\tchecking Dialog Insight administrator: False\r\nTargeted service: Sendings.SendSingle\r\nDeserializing JSON...\r\nDeserializing JSON completed\r\nValidating parameters...\r\nValidating parameterscompleted with success\r\nExecuting method...\r\nExecuting method completed with success"
    }
  end

  it 'performs correct request with passed data' do
    VCR.use_cassette('sendings_send_single') do
      expect(described_class.new.perform(data)).to eq(result)
    end
  end
end
