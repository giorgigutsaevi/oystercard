class Oystercard
	attr_reader :balance, :status, :entry_station, :exit_station, :travel_history
    
	MAXIMUM_AMOUNT = 90
	MINIMUM_TRAVEL_AMOUNT = 1
	SINGLE_RIDE = 2

	def initialize
		@balance = 0
	  @status = false
		@travel_history = []
	end

	def top_up(amount)
		@balance += amount
		fail "Can't add more balance: maximum amount surpassed" if @balance > MAXIMUM_AMOUNT
		@balance
	end

	def touch_in(station)
		fail "Not enough funds: please top up" if @balance < MINIMUM_TRAVEL_AMOUNT
		@status = true
		@entry_station = station
	end

	def touch_out(exit_station)
		@exit_station = exit_station
		@travel_history << {in: @entry_station, out: @exit_station}
		deduct(SINGLE_RIDE)
		@status = false
		@entry_station = nil
	end

	def in_journey?
		# @status 
		entry_station == nil ? @status = false : @status = true
	end

	private

	def deduct(amount)
		@balance -= amount
	end
end