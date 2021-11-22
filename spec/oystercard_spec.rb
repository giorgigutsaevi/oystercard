require 'oystercard'

describe Oystercard do
	it 'creates an instance of itself' do
		expect(Oystercard).to respond_to(:new)
	end

	it 'The default card balance is 0' do
		card = Oystercard.new
		expect(card.balance).to eq 0
	end
end