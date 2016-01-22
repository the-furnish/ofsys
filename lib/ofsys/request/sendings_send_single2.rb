module Ofsys
  module Request
    class SendingsSendSingle2 < Ofsys::Request::Base
      ENDPOINT = "#{ENDPOINT_BASE}/sendings.ashx?method=SendSingle2".freeze
    end
  end
end
