require 'station'

describe Station do
  context 'initialization'
  it 'initializes with station_name argument' do
    station_name = "liverpool"
    zone = 1
    station = Station.new(station_name, zone)
    expect(station.station_name).to eq station_name
  end

  it 'initializes with zone argument' do
    station_name = "liverpool"
    zone = 1
    station = Station.new(station_name, zone)
    expect(station.zone).to eq zone
  end
end