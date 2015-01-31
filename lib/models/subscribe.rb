module CbX
  class Subscribe
    def initialize product_id
      @type       = 'subscribe'
      @product_id = product_id
    end

    def to_h
      {
        type: @type,
        product_id: @product_id
      }
    end
  end
  
  class Recieved
    attr_reader :type, :sequence, :order_id, :size, :price, :side
    def initialize(type:, sequence:, order_id:, size:, price:, side:)
      @type     = type
      @sequence = sequence
      @order_id = order_id
      @size     = size
      @price    = price
      @side     = side
    end
  end

  class Open
    attr_reader :type, :sequence, :order_id, :remaining_size, :price, :side
    def initialize(type:, sequence:, order_id:, remaining_size:, price:, side:)
      @type            = type
      @sequence        = sequence
      @order_id        = order_id
      @remainging_size = remaining_size
      @price           = price
      @side            = side
    end
  end

  class Done
    attr_reader :type, :sequence, :order_id, :remaining_size, :price, :side, :reason
    def initialize(type:, sequence:, order_id:, remaining_size:, price:, side:, reason:)
      @type            = type
      @sequence        = sequence
      @order_id        = order_id
      @remainging_size = remaining_size
      @price           = price
      @side            = side
      @reason          = reason
    end
  end

  class Match
    attr_reader :type, :trade_id, :sequence, :maker_order_id, :taker_order_id, :time,
                :size, :price, :side
    def initialize(type:, trade_id:, sequence:, maker_order_id:, taker_order_id:, time:,
                   size:, price:, side:)
      @type           = type
      @trade_id       = trade_id
      @sequence       = sequence
      @maker_order_id = maker_order_id
      @taker_order_id = taker_order_id
      @time           = time
      @size           = size
      @price          = price
      @side           = side
    end
  end

  class Change
    attr_reader :type, :sequence, :order_id, :time, :new_size, :old_size, :price, :side
    def initialize(type:, sequence:, order_id:, time:, new_size:, old_size:, price:, side:)
      @type     = type
      @sequence = sequence
      @order_id = order_id
      @time     = time
      @new_size = new_size
      @old_size = old_size
      @price    = price
      @side     = side
    end
  end
end
