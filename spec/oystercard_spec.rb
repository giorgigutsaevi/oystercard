require 'oystercard'

describe Oystercard do
	let(:card) {Oystercard.new}
	let(:station) { double :station }
	let(:another_station) {double :station}
	let(:journeylog) {double :journeylog}

	it 'creates an instance of itself' do
		expect(Oystercard).to respond_to(:new)
	end

	it 'The default card balance is 0' do
		expect(card.balance).to eq 0
	end

	it 'responds to the #top_up method with 1 argument' do
		expect(subject).to respond_to(:top_up).with(1).argument
	end

	it 'adds the amount to the balance of the card' do
		card.top_up(20)
		expect(card.balance).to eq 20
	end
    
	it 'raises error if top_up exceeds maximum amount of 90' do
	  card.top_up(90)
	  expect { card.top_up(1) }.to raise_error "Can't add more balance: maximum amount surpassed"
    end

		describe "#touch_in" do
			it 'has a #touch_in' do
				expect(subject).to respond_to(:touch_in).with(2).argument
			end

			context "#touch_in functionality"
				it 'starts the journey' do
					card.top_up(20)
					card.touch_in(:station, 1)
					allow(journeylog).to receive(:start_journey).with(:station, 1)
					allow(journeylog).to receive(:current_journey)
					expect(journeylog.start_journey(:station, 1)).to eq journeylog.current_journey
			end
		end
		
		describe "#touch_out" do
			it 'has a #touch_out' do
				expect(subject).to respond_to(:touch_out).with(2).argument
			end

			context "Checking #touch_out deducts the SINGLE_RIDE amount"
				it "#touch_out reduces the balance by SINGLE_RIDE" do
					card.top_up(30)
					card.touch_in(:station, 1)
					expect { card.touch_out(:another_station, 1) }.to change{card.balance}.by(-Oystercard::SINGLE_RIDE)
				end

			context "#touch_out functionality"
				it "pushes a completed_journey to a journey_history array" do
					card.top_up(40)
					card.touch_in(:station, 1)
					card.touch_out(:another_station, 3)
					allow(journeylog).to receive(:finish_journey)
					allow(journeylog).to receive(:journey_history)
					expect(journeylog.finish_journey(:another_station, 3)).to eq journeylog.journey_history
				end
		end

	context 'minimum balance' 
      it 'raises an error if touch_in with balance less than 1' do
				expect { card.touch_in(station, 1) }.to raise_error("Not enough funds: please top up")
		end



end