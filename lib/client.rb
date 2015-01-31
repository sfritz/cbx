require 'yaml'
require 'hurley'
require 'cb_auth'
require 'json_response'
require 'models'

module CbX
  class Client
    def initialize(api_url:, auth:)
      @client = Hurley::Client.new(api_url)
      @client.before_call CbAuth.new(auth)
      @client.after_call JsonResponse.new
    end

    def time
      res = @client.get '/time'
      Time.at(res.body[:epoch].to_f)
    end
  end

  class Error
    attr_reader :type, :message
    def initialize(type:, message:)
      @type    = type
      @message = message
    end
  end
end
