require 'spec_helper'

describe Ofsys::Request::SendingsSendSingle do
  include ConfigureHelper
  before(:each) { configure_defaults }

  let(:data) do
    {
      idMessage: 639093,
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
              ComparisonValue: 'user@example.com'
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
      'AffectedContacts' => 1
    }
  end

  it 'performs correct request with passed data' do
    VCR.use_cassette('sendings_send_single') do
      expect(described_class.new.perform(data)).to include_partial_hash(result)
    end
  end
end
