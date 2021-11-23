class Oystercard
	attr_reader :balance, :status
    
	MAXIMUM_AMOUNT = 90
	MINIMUM_TRAVEL_AMOUNT = 1
	SINGLE_RIDE = 2

	def initialize
		@balance = 0
	    @status = false
	end

	def top_up(amount)
		@balance += amount
		fail "Can't add more balance: maximum amount surpassed" if @balance > MAXIMUM_AMOUNT
		@balance
	end

	def touch_in
		fail "Not enough funds: please top up" if @balance < MINIMUM_TRAVEL_AMOUNT
		@status = true
	end

	def touch_out
		deduct(SINGLE_RIDE)
		@status = false
	end

	def in_journey?
		@status
	end

	private

	def deduct(amount)
		@balance -= amount
	end
end