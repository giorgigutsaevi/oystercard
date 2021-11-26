require_relative "journey"

class JourneyLog

	attr_accessor :current_journey
	attr_accessor :journeys


	def initialize(journey_class = Journey)
		@journey_class = journey_class
		@journeys = []
		@current_journey
	end

	def start_journey(entry_station, entry_zone)
		check_current_journey
		@current_journey.start(entry_station, entry_zone)
	end

	def finish_journey(exit_station, zone)
		check_current_journey
		@current_journey.finish(exit_station, zone)
		@journeys.push(@current_journey)
		@current_journey = nil
	end

	def show_history
		duplicate_journeys.each do |journey|
			print "In: #{journey.entry_station} Station - Zone: #{journey.entry_zone}.\nOut: #{journey.exit_station} Station - Zone: #{journey.exit_zone}."
		end
	end

	private 

	def check_current_journey
		@current_journey ||= @journey_class.new
	end

	def duplicate_journeys
		@journeys.dup
	end
	
end

