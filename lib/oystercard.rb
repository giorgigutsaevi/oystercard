require_relative 'journey'
class Oystercard
	attr_reader :balance, :in_journey, :entry_station, :exit_station, :travel_history, :journey
    
	MAXIMUM_AMOUNT = 90
	MINIMUM_TRAVEL_AMOUNT = 1
	SINGLE_RIDE = 2

	def initialize
		@balance = 0
	  @in_journey = false
		@travel_history = []
	end

	def top_up(amount)
		@balance += amount
		fail "Can't add more balance: maximum amount surpassed" if @balance > MAXIMUM_AMOUNT
		@balance
	end

	def touch_in(station)
		fail "Not enough funds: please top up" if @balance < MINIMUM_TRAVEL_AMOUNT
		@in_journey = true
		@entry_station = station
		@start = station
	end

	def touch_out(exit_station)
		@exit_station = exit_station
		@travel_history << {in: @entry_station, out: @exit_station}
		deduct(SINGLE_RIDE)
		@in_journey = false
		@entry_station = nil
	end

	def in_journey?
		entry_station == nil ? @in_journey = false : @in_journey = true
	end

	private

	def deduct(amount)
		@balance -= amount
	end
end
