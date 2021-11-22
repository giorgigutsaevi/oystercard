require 'oystercard'

describe Oystercard do
	it 'creates an instance of itself' do
		expect(Oystercard).to respond_to(:new)
	end

	it 'The default card balance is 0' do
		card = Oystercard.new
		expect(card.balance).to eq 0
	end

	it 'responds to the #top_up method with 1 argument' do
		expect(subject).to respond_to(:top_up).with(1).argument
	end

	it 'adds the amount to the balance of the card' do
		card = Oystercard.new
		card.top_up(20)
		expect(card.balance).to eq 20
	end
    
	it 'raises error if top_up exceeds maximum amount of 90' do
    card = Oystercard.new
	  card.top_up(90)
	  expect { card.top_up(1) }.to raise_error "Can't add more balance: maximum amount surpassed"
    end

	context "#deduct method"
		it 'has a #deduct method with 1 argument' do
			expect(subject).to respond_to(:deduct).with(1).argument
		end

		it 'deducts the amount given from @balance' do
			card = Oystercard.new
			card.top_up(20)
			first_balance = card.balance
			card.deduct(10)
			expect(card.balance).to eq (first_balance - 10)
		end
	context "state (status) of the card"
	    it 'respond to touch_in' do
			expect(subject).to respond_to(:touch_in)
		end

	    it 'let us know the state of the card' do
		   card = Oystercard.new
		   card.top_up(20)
		   card.touch_in
		   expect(card.status).to eq true
	    end

		it 'respond to touch_out' do
			expect(subject).to respond_to(:touch_out)
		end

		it 'let us know the state of the card' do
			card = Oystercard.new
			card.top_up(20)
			card.touch_in
			card.touch_out
			expect(card.status).to eq false
		 end

		it 'respond to in_journey?' do
			expect(subject).to respond_to(:in_journey?)
		end

		it 'confirms that status is true after touch_in' do
			card = Oystercard.new
			card.touch_in
		    expect(card.in_journey?).to be_truthy
		end
end