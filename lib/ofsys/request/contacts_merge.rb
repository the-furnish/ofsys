module Ofsys
  module Request
    class ContactsMerge < Ofsys::Request::Base
      ENDPOINT = "#{ENDPOINT_BASE}/contacts.ashx?method=Merge".freeze
    end
  end
end
