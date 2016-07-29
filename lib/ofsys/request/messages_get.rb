module Ofsys
  module Request
    class MessagesGet < Ofsys::Request::Base
      ENDPOINT = "#{ENDPOINT_BASE}/messages.ashx?method=Get".freeze
    end
  end
end
