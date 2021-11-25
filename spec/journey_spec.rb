require 'journey'

describe Journey do
	subject {Journey.new}
	let(:station) {double :station, zone: 1}

	context "initialization"
	it 'creates an instance of itself' do
		expect(subject).to be_an_instance_of(Journey)
	end

	context "#start"
	it "has a #start method" do
		expect(subject).to respond_to(:start)
	end

	it 'has an entry station' do
		expect(subject.entry_station).to eq subject.entry_station
	end

	it 'has a penalty fare by default' do
    expect(subject.calculate_fare).to eq Journey::PENALTY_FARE
  end

	context "#finish" 
	it "has a #finish method" do
		expect(subject).to respond_to(:finish)
	end

	it 'has an exit station' do
		expect(subject.exit_station).to eq subject.exit_station
	end

	context "#complete?"
	it "has a #complete? method" do
		expect(subject).to respond_to(:complete?)
	end

	it "knows a journey is complete" do
		subject.entry_station = "Wembley Park"
		subject.exit_station = 'Angel'
		expect(subject.complete?).to eq true
	end

	it "knows a journey is NOT complete" do
		subject.entry_station = "Bow"
		subject.exit_station = nil
		expect(subject.complete?).to eq false
	end
	
	context "#fare"
	it 'has a #fare method' do
		expect(subject).to respond_to(:calculate_fare)
	end

	it 'returns MINIMUM_FARE (1) if the journey is complete' do
		subject.start("Angel", 1)
		subject.finish("Liverpool St.", 1)
		expect(subject.calculate_fare).to eq 1
	end

	it 'returns PENALTY_FARE (6) if the journey is NOT complete' do
		subject.start("Angel", 1)
		expect(subject.calculate_fare).to eq 6
	end

end