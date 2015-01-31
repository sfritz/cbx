module CbX
  class Transfer
    def initialize amount, coinbase_account_id
      @amount              = amount
      @coinbase_account_id = coinbase_account_id
    end

    def to_h
      {
        type:                @type,
        amount:              @amount,
        coinbase_account_id: @coinbase_account_id
      }
    end
  end

  class Deposit < Transfer
    def initialize amount, coinbase_account_id
      super(amount, coinbase_account_id)
      @type = 'deposit'
    end
  end

  class Withdraw < Transfer
    def initialize amount, coinbase_account_id
      super(amount, coinbase_account_id)
      @type = 'withdraw'
    end
  end
end