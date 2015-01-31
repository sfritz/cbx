require 'hurley'
require 'handlers'
require 'models'

module CbX
  class Client
    def initialize(api_url:, auth:)
      @client = Hurley::Client.new(api_url)
      @client.before_call CbAuth.new(auth)
      @client.after_call JsonResponse.new
      @client.after_call Error.new
    end

    def time
      res = @client.get '/time'
      Time.at(res.body[:epoch].to_f)
    end

    def accounts
      begin
        res = @client.get('/accounts')
        puts res.body
      rescue ServiceError => e
        p e.status_code
      end
    end
  end

end
