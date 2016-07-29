module Ofsys
  module Request
    class MessagesUpdate < Ofsys::Request::Base
      ENDPOINT = "#{ENDPOINT_BASE}/messages.ashx?method=Update".freeze
    end
  end
end
