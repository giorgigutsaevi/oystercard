require_relative 'journey'
require_relative "journeylog"

class Oystercard
  attr_reader :balance
  attr_reader :journeylog

  MAXIMUM_AMOUNT = 90
  MINIMUM_TRAVEL_AMOUNT = 1
	FAIR = 1

  def initialize
    @balance = 0
    @journeylog = JourneyLog.new
  end

  def top_up(amount)
    @balance += amount
    if @balance > MAXIMUM_AMOUNT
      fail "Can't add more balance: maximum amount surpassed"
    end
    @balance
  end

  def touch_in(station, zone)
    fail 'Not enough funds: please top up' if @balance < MINIMUM_TRAVEL_AMOUNT
    @journeylog.start_journey(station, zone)
  end

  def touch_out(exit_station, zone)
    @journeylog.finish_journey(exit_station, zone)
		deduct(@journeylog.current_journey.calculate_fare)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
