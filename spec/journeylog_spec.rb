
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
		
		it "it assigns current_journey variable to entry_station & entry_zone" do
			subject.start_journey(entry_station, 1)
			expect(subject.current_journey).not_to eq(nil)
		end
	end

	describe "Finishing a journey" do
		it "has a #finish_journey method" do
			expect(subject).to respond_to(:finish_journey)
		end

		it "pushes the finished journey in a journeys array" do
			subject.start_journey(entry_station, 1)
			subject.finish_journey(exit_station, 3)
			expect(subject.journeys.size).to eq 1
		end

		it "makes current_journey nil after finishing journey" do
			subject.start_journey(entry_station, 1)
			subject.finish_journey(exit_station, 4)
			expect(subject.current_journey).to eq nil
		end
	end

	describe "#show_history" do
		context "Showing journey history"
			it "has a #show_history method" do
				expect(subject).to respond_to(:show_history)
			end

		context "displaying history"
			it "prints a journey history" do
				subject.start_journey(entry_station, 1)
				subject.finish_journey(exit_station, 3)
				message = "In: #{entry_station} Station - Zone: #{1}.\nOut: #{exit_station} Station - Zone: #{3}."
				expect {subject.show_history}.to output(message).to_stdout
			end
	end

end