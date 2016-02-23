module Ofsys
  module Request
    class ContactsGet < Ofsys::Request::Base
      ENDPOINT = "#{ENDPOINT_BASE}/contacts.ashx?method=Get".freeze
    end
  end
end
