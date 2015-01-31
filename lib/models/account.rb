module CbX
  # GET /accounts/<account-id>
  class Account
    attr_reader :id, :balance, :hold, :available, :currency
    def initialize(id:, balance:, hold:, available:, currency:)
      @id        = id
      @balance   = balance
      @hold      = hold
      @available = available
      @currency  = currency
    end

    # GET /accounts/<account-id>/holds
    class Hold
      attr_reader :created_at, :updated_at, :order_id, :amount, :account_id
      def iniitialize(created_at:, updated_at:, order_id:, amount:, account_id:)
        @created_at = created_at
        @updated_at = updated_at
        @order_id   = order_id
        @amount     = amount
        @account_id = account_id
      end
    end

    # Account History
    # GET /accounts/<account-id>/ledger
    class Ledger
      attr_reader :id, :time, :amount, :balance, :type, :details
      def initialize(id:, time:, amount:, balance:, type:, details:)
        @id      = id
        @time    = time
        @amount  = amount
        @balance = balance
        @type    = type
        @details = Details.new details
      end

      class Details
        attr_reader :order_id, :trade_id, :product_id
        def initialize(order_id:, trade_id:, product_id:)
          @order_id   = order_id
          @trade_id   = trade_id
          @product_id = product_id
        end
      end
    end
  end
end