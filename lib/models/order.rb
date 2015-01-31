module CbX 
  # POST /orders
  class OrderRequest
    attr_reader :size, :price, :side, :product_id, :stp
    def initiailize(size:, price:, side:, product_id:, stp: 'dc')
      @size       = size
      @price      = price
      @side       = side
      @product_id = product_id
      # self-trade prevention
      # decrease-and-cancel by default
      @stp        = stp
    end
  end

  # Get /orders/<order-id>
  class OpenOrder
    attr_reader :id, :size, :price, :product_id, :status, :filled_size,
                :fill_fees, :settled, :side, :time
    def initialize(id:, size:, price:, product_id:, status:, filled_size:,
                   fill_fees:, settled:, side:, time:)
      @id          = id
      @size        = size
      @price       = price
      @product_id  = product_id
      @status      = status
      @filled_size = filled_size
      @fill_fees   = fill_fees
      @settled     = settled
      @side        = side
      @time        = time
    end
  end

  # GET /fills
  class FilledOrder
    attr_reader :trade_id, :prodcut_id, :price, :size, :order_id, :time,
                :fee, :settled, :side
    def initialize(trade_id:, prodcut_id:, price:, size:, order_id:, time:,
                   fee:, settled:, side:)
      @trade_id   = trade_id
      @product_id = product_id
      @price      = price
      @size       = size
      @order_id   = order_id
      @time       = time
      @fee        = fee
      @settled    = settled
      @side       = side
    end
  end
end