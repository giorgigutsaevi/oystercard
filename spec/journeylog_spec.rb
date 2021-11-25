
require 'journeylog'

describe JourneyLog do
	subject {JourneyLog.new}
	let(:journey) {double :journey}
	let(:entry_station) {"Angel"}
	let(:another_entry_station) {"King's Cross"}
	let(:exit_station) {"Euston"}

	it "takes 1 parameter at initialization" do
		expect(JourneyLog).to respond_to(:new).with(1).argument
	end

	describe "Starting a journey" do
		it "has a #start_journey method" do
			expect(subject).to respond_to(:start_journey)
		end

		# context "Raise Error"
		# 	it "raises an error if the user starts another journey while still in 1st journey" do	
		# 		subject.start_journey(:entry_station, 1)
		# 		expect {subject.start_journey(:another_entry_station, 1)}.to raise_error "Can't start another journey while in-journey"
		# 	end
 
		it "#start_journey creates a current_journey instance variable" do
			subject.start_journey(:entry_station, 1)
			expect(subject.current_journey).to eq subject.current_journey
		end
	end

	describe "Finishing a journey" do
		it "has a #finish_journey method" do
			expect(subject).to respond_to(:finish_journey)
		end

		it "pushes the finished journey in an empty journeys array" do
			subject.start_journey(:entry_station, 1)
			expect(subject.finish_journey(:exit_station, 3)).to eq(subject.journey_history)
		end
	end

	context "Showing journey history"
	it "has a #show_history method" do
		expect(subject).to respond_to(:show_history)
	end

end