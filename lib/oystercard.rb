require_relative 'journey'
require_relative "journeylog"

class Oystercard
  attr_reader :balance


  MAXIMUM_AMOUNT = 90
  MINIMUM_TRAVEL_AMOUNT = 1
  SINGLE_RIDE = 2

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
    deduct(SINGLE_RIDE)
    @journeylog.finish_journey(exit_station, zone)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
