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

end