require 'yajl'

module Ofsys
  module Request
    class Base
      class FailedError < RuntimeError; end

      def self.suppress_id_project
        @suppress_id_project = true
      end

      def initialize(config = Ofsys.config)
        @id_key = config.id_key
        @key = config.key
        @id_project = config.id_project
      end

      def perform(params = {})
        request.body = body(params)
        result_body = http.request(request).body
        decode_result(result_body)
      end

      private

      ENDPOINT_BASE = 'https://ofsys.com/webservices/ofc4'.freeze

      def request
        @request ||= Net::HTTP::Post.new(uri.request_uri)
      end

      def uri
        @uri ||= URI.parse(self.class::ENDPOINT)
      end

      def http
        @http ||= build_http
      end

      def build_http
        Net::HTTP.new(uri.host, uri.port).tap do |http|
          http.use_ssl = true
        end
      end

      def body(source_params)
        params = merge_auth(source_params)
        params.merge!(idProject: @id_project) unless suppress_id_project?
        to_json(params)
      end

      def to_json(hash)
        ::Yajl::Encoder.encode(hash)
      end

      def to_hash(text)
        ::Yajl::Parser.parse(text)
      end

      def merge_auth(source_params)
        source_params.merge!(
          AuthKey: {
            Key: @key,
            idKey: @id_key
          }
        )
      end

      def suppress_id_project?
        self.class.instance_variable_get(:@suppress_id_project) || false
      end

      def decode_result(body)
        result = to_hash(body)
        fail FailedError.new(body) unless result['Success']
        result
      end
    end
  end
end
