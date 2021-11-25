require_relative 'station'

class Journey
	PENALTY_FARE = 6
	MINIMUM_FARE = 1

	attr_accessor :entry_station
	attr_accessor :exit_station
	attr_accessor :entry_zone
	attr_accessor :exit_zone

	def initialize
		@entry_station
		@exit_station 
	end

	def start(station, entry_zone)
		@entry_station = station
		@entry_zone = entry_zone
	end	

	def finish(station, exit_zone)
    @exit_station = station
		@exit_zone = exit_zone
  end

	def in_journey?
  	@entry_station != nil && @exit_station == nil
  end

	def complete?
		@entry_station != nil && @exit_station != nil ? true : false
	end

	def fare 
		self.complete? ? MINIMUM_FARE : PENALTY_FARE
	end
end