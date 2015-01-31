# Must come after JsonResponse to get body
module CbX
  class Error
    def name
      :error
    end

    def call res
      if res.success?
        # no-op
      elsif res.client_error? || res.server_error?
        raise ServiceError.new(res.status_code), res.body
      elsif res.redirect?
        throw "Follow more redirects?"
      end
    end
  end
end
