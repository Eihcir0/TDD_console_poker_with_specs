require_relative 'card'

class Deck
  attr_reader :deck

  def initialize
    @deck = build_deck
  end

  def build_deck
    deck = Card::SUITS.keys.product(Card::VALUES.keys)
  end

  def shuffle!
    @deck.shuffle!
  end


  def deal
    @deck.pop
  end


end#class

# d = Deck.new
#
# p d.build_deck
