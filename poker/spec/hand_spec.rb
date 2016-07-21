require 'hand'

describe Hand do
  let(:card1) { double('card1', :value => 4, :suit => :diamonds)}
  let(:card2) { double('card2', :value => 4, :suit => :spades)}
  let(:card3) { double('card3', :value => 4, :suit => :clubs)}
  let(:card4) { double('card4', :value => 4, :suit => :hearts)}
  let(:card5) { double('card5', :value => 3, :suit => :hearts)}
  subject(:hand1) { Hand.new(card1, card2, card3, card4, card5) }

  let(:card6) { double('card6', :value => 6, :suit => :clubs)}
  let(:card7) { double('card7', :value => 7, :suit => :clubs)}
  let(:card8) { double('card8', :value => 8, :suit => :clubs)}
  let(:card9) { double('card9', :value => 9, :suit => :clubs)}
  let(:card10) { double('card10', :value => 10, :suit => :clubs)}
  subject(:hand2) { Hand.new([card6, card7, card8, card9, card10]) }



  describe '#no_pair' do
    it 'handles no pair' do
      expect(hand1.no_pair).to eq(0)
    end
  end

  describe '#one_pair' do
    it 'handles one pair' do
      expect(hand1.one_pair).to eq(1)
    end
  end

  describe '#two_pair' do
    let(:cardF) { double('cardF', :value => 2, :suit => :clubs)}
    let(:cardG) { double('cardG', :value => 3, :suit => :hearts)}
    let(:cardH) { double('cardH', :value => 2, :suit => :diamonds)}
    let(:cardI) { double('cardI', :value => 4, :suit => :clubs)}
    let(:cardJ) { double('cardJ', :value => 4, :suit => :hearts)}
    subject(:hand4) { Hand.new([cardF, cardG, cardH, cardI, cardJ]) }
    it 'handles two pair' do
      expect(hand4.two_pair).to eq(2)
    end
  end

  describe '#three_of_a_kind' do
    it 'handles three of a kind' do
      expect(hand1.three_of_a_kind).to eq(3)
    end
  end

  describe '#straight' do
    it 'handles straight' do
      expect(hand2.straight).to eq(4)
    end
  end

  describe '#flush' do
    it 'flush' do
      expect(hand2.flush).to eq(5)
    end
  end

  describe '#full_house' do
    let(:cardA) { double('cardA', :value => 2, :suit => :clubs)}
    let(:cardB) { double('cardB', :value => 2, :suit => :hearts)}
    let(:cardC) { double('cardC', :value => 2, :suit => :diamonds)}
    let(:cardD) { double('cardD', :value => 4, :suit => :clubs)}
    let(:cardE) { double('cardE', :value => 4, :suit => :hearts)}
    subject(:hand3) { Hand.new([cardA, cardB, cardC, cardD, cardE])}
    it 'handles full house' do
      expect(hand3.full_house).to eq(6)
    end
  end

  describe '#four_of_a_kind' do
    it 'handles four of a kind' do
      expect(hand1.four_of_a_kind).to eq(7)
    end
  end

  describe '#straight_flush' do
    it 'handles straight flush' do
      expect(hand2.straight_flush).to eq(8)
    end
  end

  describe '#compare_hands' do
    it 'handles two hands' do
      expect(hand1.compare(hand2)).to eq(-1)
    end
  end



end
