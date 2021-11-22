class Oystercard
	attr_reader :balance, :status
    
	MAXIMUM_AMOUNT = 90

	def initialize
		@balance = 0
	    @status = false
	end

	def top_up(amount)
		@balance += amount
		fail "Can't add more balance: maximum amount surpassed" if @balance > MAXIMUM_AMOUNT
		@balance
	end

	def deduct(amount)
		@balance -= amount
	end

	def touch_in
		@status = true
	end

	def touch_out
		@status = false
	end

	def in_journey?
		@status
	end
end