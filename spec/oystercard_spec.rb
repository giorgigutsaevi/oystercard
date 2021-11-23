require 'oystercard'

describe Oystercard do
	let(:card) {Oystercard.new}
	let(:station) { double :station }
	let(:exit_station) {double :station }

	it 'creates an instance of itself' do
		expect(Oystercard).to respond_to(:new)
	end

	it 'The default card balance is 0' do
		# card = Oystercard.new
		expect(card.balance).to eq 0
	end

	it 'responds to the #top_up method with 1 argument' do
		expect(subject).to respond_to(:top_up).with(1).argument
	end

	it 'adds the amount to the balance of the card' do
		# card = Oystercard.new
		card.top_up(20)
		expect(card.balance).to eq 20
	end
    
	it 'raises error if top_up exceeds maximum amount of 90' do
    # card = Oystercard.new
	  card.top_up(90)
	  expect { card.top_up(1) }.to raise_error "Can't add more balance: maximum amount surpassed"
    end

	# context "#deduct method"
	# 	it 'has a #deduct method with 1 argument' do
	# 		expect(subject).to respond_to(:deduct).with(1).argument
	# 	end

		# it 'deducts the amount given from @balance' do
		# 	# card = Oystercard.new
		# 	card.top_up(20)
		# 	first_balance = card.balance
		# 	card.deduct(10)
		# 	expect(card.balance).to eq (first_balance - 10)
		# end

	context "state (status) of the card"
	    it 'respond to touch_in' do
			expect(subject).to respond_to(:touch_in).with(1).argument
		end

	    it 'let us know the state of the card' do
		  #  card = Oystercard.new
		   card.top_up(20)
		   card.touch_in(station)
		   expect(card.status).to eq true
	    end

		it 'respond to touch_out' do
			expect(subject).to respond_to(:touch_out).with(1).argument
		end

		it 'let us know the state of the card' do
			# card = Oystercard.new
			card.top_up(20)
			card.touch_in(station)
			card.touch_out(exit_station)
			expect(card.status).to eq false
		 end

		it 'respond to in_journey?' do
			expect(subject).to respond_to(:in_journey?)
		end

		it 'confirms that status is true after touch_in' do
			# card = Oystercard.new  
			card.top_up(5)
			card.touch_in(station)
		    expect(card.in_journey?).to be_truthy
		end

	context 'minimum balance' 
        it 'raises an error if touch_in with balance less than 1' do
			# card = Oystercard.new
			expect { card.touch_in(station) }.to raise_error("Not enough funds: please top up")
		end

	context 'touch out balance'
		it 'deducts single ride fare from balance when touch_out' do
			# card = Oystercard.new
			card.top_up(20)
			card.touch_in(station)
			expect { card.touch_out(exit_station) }.to change{ card.balance} .by(-Oystercard::SINGLE_RIDE)
		end

	context "Entry station"
		it 'remembers the entry station when touch_in(station)' do
			card.top_up(20)
			card.touch_in(station)
			expect(card.entry_station).to eq station
		end

		context "Card forgets station on touch_out"
		it 'forgets the entry station when touch_out' do
			card.top_up(20)
			card.touch_in(station)
			card.touch_out(exit_station)
			expect(card.entry_station).to eq nil
		end

		context "travel history"
		it 'stores entry and exit stations of each travel' do
			card.top_up(20)
			card.touch_in(station)
			card.touch_out(exit_station)
			expect(card.exit_station).to eq exit_station
		end

		it 'checks that the card has an empty list of journey by default' do
			card.top_up(20)
			expect(card.travel_history).to match_array([])
		end

		it 'checks that touching in/out creates 1 journey' do
			card.top_up(20)
			card.touch_in(station)
			card.touch_out(exit_station)
			expect(card.travel_history.size).to eq 1
		end
	

end