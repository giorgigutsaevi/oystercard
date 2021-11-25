require_relative "journey"

class JourneyLog

	attr_accessor :current_journey
	attr_accessor :journey_history

	def initialize(current_journey = nil)
		@journey_history = []
		@current_journey = current_journey
	end

	def start_journey(entry_station, entry_zone)
		raise "Can't start another journey while in-journey" if @current_journey != nil
		create_journey(entry_station, entry_zone) if @current_journey == nil 
	end

	def finish_journey(exit_station, zone)
		@current_journey.finish(exit_station, zone)
		@journey_history.push(@current_journey)
	end

	def show_history
		journeys.each do |journey|
			puts "In: #{journey.entry_station} Station Zone: #{journey.entry_zone}.\nOut: #{journey.exit_station} Station. Zone:#{journey.exit_zone}"
		end
	end

	private 
	def create_journey(entry_station, entry_zone)
		@current_journey = Journey.new
		@current_journey.start(entry_station, entry_zone)
	end

	def journeys
		@journey_history.dup
	end
	
end

