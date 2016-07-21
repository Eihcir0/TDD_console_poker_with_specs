require 'deck'

describe Deck do

  let(:my_deck) {Deck.new}

  describe 'build_deck' do
    it 'contains 52 cards' do
      expect(my_deck.deck.size).to eq(52)
    end

    it 'contains all unique cards' do
      cards = my_deck.deck.map{|el| el.to_s}
      expect(cards).to eq(cards.uniq)
    end

  end

  describe 'shuffle!' do
    it 'shuffles cards' do
      original_deck = my_deck.deck.dup
      my_deck.shuffle!
      expect(my_deck.deck).to_not eq(original_deck)
    end
  end

  describe '#deal' do
  
    it 'deals one card from top of deck' do
      card = my_deck.deck.last
      expect(my_deck.deal).to eq(card)
    end

    it 'removes card from deck' do
      num_cards = my_deck.deck.size
      my_deck.deal
      expect(my_deck.deck.size).to eq(num_cards - 1)
    end

  end

end#class
