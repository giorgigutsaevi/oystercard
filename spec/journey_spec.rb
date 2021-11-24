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

	it '#start method returns a entry_station' do
		expect(subject.start("Hackney Central")).to eq subject.entry_station
	end

	context "#finish" 
	it "has a #finish method" do
		expect(subject).to respond_to(:finish)
	end

	it '#finish method returns an exit_station' do
		expect(subject.finish("Kentish Town")).to eq subject.exit_station
	end

	context "#complete?"
	it "has a #complete? method" do
		expect(subject).to respond_to(:complete?)
	end
	
	context "#fare"
	it 'has a #fare method' do
		expect(subject).to respond_to(:fare)
	end

	it 'returns MINIMUM_FARE (1) if the journey is complete' do
		subject.start("Angel")
		subject.finish("Liverpool St.")
		expect(subject.fare).to eq 1
	end

	it 'returns PENALTY_FARE (6) if the journey is NOT complete' do
		subject.start("Angel")
		expect(subject.fare).to eq 6
	end
	


end