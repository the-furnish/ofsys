module Ofsys
  module Request
    class RelationalTablesDelete < Ofsys::Request::Base
      ENDPOINT = "#{ENDPOINT_BASE}/relationaltables.ashx?method=Delete".freeze

      suppress_id_project
    end
  end
end
