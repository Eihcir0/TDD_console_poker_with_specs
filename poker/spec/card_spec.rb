require 'card'
require 'rspec'

describe Card do

  describe '#initialize' do
    it 'only accepts valid suits' do
      expect{Card.new(5, :happy_face)}.to raise_error("Invalid suit")
    end

    it 'only accepts valid values' do
      expect{Card.new(14, :clubs)}.to raise_error("Invalid value")
    end

    it 'initializes correctly' do
      expect{Card.new(5, :clubs)}.not_to raise_error
    end

  end

  describe "#to_s" do
    card = Card.new(3,:hearts)
    it 'prints with to_s' do
      expect(card.to_s).to eq(" 3H")
    end
  end

end
