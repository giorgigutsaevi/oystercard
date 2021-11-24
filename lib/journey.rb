require_relative 'station'

class Journey
	PENALTY_FARE = 6
	MINIMUM_FARE = 1

	attr_reader :entry_station, :exit_station

	def initialize
		@entry_station
		@exit_station
	end

	def start(station)
		@entry_station = station
	end	

	def finish(station)
    @exit_station = station
  end

	def complete?
		@entry_station != nil && @exit_station != nil ? true : false
	end

	def fare 
		self.complete? ? MINIMUM_FARE : PENALTY_FARE
	end
end

