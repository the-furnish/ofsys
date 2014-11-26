module Ofsys
  module Request
    class ContactsDelete < Ofsys::Request::Base
      ENDPOINT = "#{ENDPOINT_BASE}/contacts.ashx?method=Delete".freeze
    end
  end
end
