module Ofsys
  module Request
    class RelationalTablesMerge < Ofsys::Request::Base
      ENDPOINT = "#{ENDPOINT_BASE}/relationaltables.ashx?method=Merge".freeze
    end
  end
end
