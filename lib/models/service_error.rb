module CbX
  class ServiceError < RuntimeError
    attr :status_code
    def initialize(status_code)
      super(message)
      @status_code  = status_code
    end
  end
end