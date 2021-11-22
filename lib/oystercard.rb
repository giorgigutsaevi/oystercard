class Oystercard
	attr_reader :balance
    
	MAXIMUM_AMOUNT = 90

	def initialize
		@balance = 0
	end

	def top_up(amount)
		@balance += amount
		fail "Can't add more balance: maximum amount surpassed" if @balance > MAXIMUM_AMOUNT
		@balance
	end

	def deduct(amount)
		@balance -= amount
	end

end