module CbX
  # GET /currencies
  class Currency
    attr_reader :id, :name, :min_size
    def initialize(id:, name:, min_size:)
      @id       = id
      @name     = name
      @min_size = min_size
    end
  end
end