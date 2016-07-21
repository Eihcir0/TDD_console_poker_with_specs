require_relative 'card'
require 'byebug'
class Array
  def deep_dup
    new_array = []
    self.each do |el|
      new_array << (el.is_a?(Array) ? el.deep_dup : el)
    end
    new_array
  end
end#class

class Hand

HANDS =  [:no_pair, :one_pair, :two_pair, :three_of_a_kind,
  :straight, :flush, :full_house, :four_of_a_kind, :straight_flush]

  attr_reader :hand_rank
  def initialize(*cards)
    @cards = cards.flatten
    p @cards
    p @cards.class
    @hand_values = @cards.map{|card| card.value}
    @hand_suits = @cards.map{|card| card.suit}
    build_hand_rank_hash
    @hand_rank = @hand_rank_hash.values.max
  end

  def compare(hand2)
    @hand_rank <=> hand2.hand_rank
  end


  def build_hand_rank_hash
    @hand_rank_hash = Hash.new
    HANDS.each do |hand|
      @hand_rank_hash[hand] = send(hand)
    end
  end

  def no_pair
    0
  end

  def one_pair
      multiple_cards(2) ? 1 : -1
  end

  def two_pair
    return false unless one_pair
    pair = multiple_cards(2)
    remainder = @hand_values.deep_dup - [pair]

    if remainder.length > 1
      remainder.each do |card_value|
        return 2 if remainder.count(card_value) >=2
      end
    end
    -1
  end

  def three_of_a_kind
    multiple_cards(3) ? 3 : -1
  end

  def straight
    hand_vals = @hand_values.deep_dup.sort
    count = 0
    return 4 if in_a_row(hand_vals) == 4
    # map Ace to 14, sort, and check again:

    hand_vals2 = @hand_values.deep_dup.map{|el| el == 1 ? 14 : el}.sort
    return 4 if in_a_row(hand_vals2) == 4
    -1
  end

  def flush
    (Card::SUITS.keys.include?(multiple_cards(5,false))) ? 5 : -1
  end

  def full_house
    return false unless three_of_a_kind
    remainder = @hand_values.deep_dup - [multiple_cards(3)]
    if remainder.length == 2
      return 6 if remainder[0]==remainder[1]
    end
    -1
  end

  def four_of_a_kind
    multiple_cards(4) ? 7 : -1
  end

  def straight_flush
    straight>0 && flush>0 ? 8 : -1
  end

  #returns card.value if hand contains x cards of same value
  #accepts parameter value (true = counts value, false = counts suit)
  def multiple_cards(x, value=true)
    queue = (value ? @hand_values.deep_dup : @hand_suits.deep_dup)
    queue.each do |card|
      return card if queue.count(card)>=x
    end
    false
  end

  def in_a_row(hand_vals) #returns number of cards in a row
    count = 0
    queue = hand_vals.dup
    queue.each_with_index do |card_val, idx|
      # debugger
      next if idx == 0
      count +=1 if card_val - queue[idx - 1] == 1
    end
    count
  end


end#class

cards1 = []
(1..5).each{|i| cards1 << Card.new(i,:clubs)}

a = Card.new(5,:clubs)
b = Card.new(5,:hearts)
c = Card.new(5,:spades)
d = Card.new(5,:diamonds)
e = Card.new(4,:diamonds)
f = Hand.new(cards1)
g = Hand.new([a,b,c,d,e])
