module Ofsys
  module Request
    class RelationalTablesMerge < Ofsys::Request::Base
      ENDPOINT = "#{ENDPOINT_BASE}/relationaltables.ashx?method=Merge".freeze

      suppress_id_project
    end
  end
end
