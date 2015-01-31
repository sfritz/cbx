module CbX
  # GET /products
  class Product
    attr_reader :id, :base_currency, :quote_currency, :base_min_size, :base_max_size,
                :quote_increment
    def initialize(id:, base_currency:, quote_currency:, base_min_size:, base_max_size:,
                quote_increment:)
      @id              = id
      @base_currency   = base_currency
      @quote_currency  = quote_currency
      @base_min_size   = base_min_size
      @base_max_size   = base_max_size
      @quote_increment = quote_increment
    end

    # GET /products/<product-id>/book
    class Ticker
      attr_reader :trade_id, :price, :size, :time
      def initialize(trade_id:, price:, size:, time:)
        @trade_id = trade_id
        @price    = price
        @size     = size
        @time     = time
      end
    end

    # GET /products/<product-id>/trades
    class Trade
      attr_reader :time, :trade_id, :price, :size, :side
      def initialize(time:, trade_id:, price:, size:, side:)
        @time     = time
        @trade_id = trade_id
        @price    = price
        @size     = size
        @side     = side
      end
    end

    # GET /products/<product-id>/candles
    class Candle
      attr_reader :time, :low, :high, :open, :close, :volume
      def initialize arr
        @time   = arr[0]
        @low    = arr[1]
        @high   = arr[2]
        @open   = arr[3]
        @close  = arr[4]
        @volume = arr[5]
      end
    end

    # GET /products/<product-id>/stats
    class Stat
      attr_reader :open, :close, :high, :low, :volume
      def initialize(open:, close:, high:, low:, volume:)
        @open   = open
        @close  = close
        @high   = high
        @low    = low
        @volume = volume
      end
    end

    # GET /products/BTC-USD/book
    class OrderBook
      attr_reader :sequence, :bids, :asks
      def initialize(sequence:, bids:, asks:)
        @sequence = sequence
        @bids     = bids.map{ |b| Bid.new(b) }
        @asks     = asks.map{ |a| Ask.new(a) }
      end

      # Level 1&2, 3 has order_id
      class Quote
        attr_reader :price, :size, :num_orders
        def initialize arr
          @price      = arr[0]
          @size       = arr[1]
          @num_orders = arr[2]
        end
      end

      class Bid < Quote
      end

      class Ask < Quote
      end
    end
  end
end