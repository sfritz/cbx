require 'json'

module CbX
  class JsonResponse
      def name
        :json_response
      end

      def call res
        res.body = JSON.parse(res.body, symbolize_names: true)
      end
  end
end