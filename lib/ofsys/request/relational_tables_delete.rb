module Ofsys
  module Request
    class RelationalTablesDelete < Ofsys::Request::Base
      ENDPOINT = "#{ENDPOINT_BASE}/relationaltables.ashx?method=Delete".freeze
    end
  end
end
