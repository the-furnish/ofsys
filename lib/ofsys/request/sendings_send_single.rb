module Ofsys
  module Request
    class SendingsSendSingle < Ofsys::Request::Base
      ENDPOINT = "#{ENDPOINT_BASE}/sendings.ashx?method=SendSingle".freeze
    end
  end
end
