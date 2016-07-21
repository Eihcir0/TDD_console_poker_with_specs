require 'tower'
require 'rspec'

describe Tower do
  let(:tower) {Tower.new}

  describe '#initialize' do
    it 'handles initialization correctly' do
      expect(tower.columns).to eq([[3,2,1],[],[]])
    end
  end

  describe '#move' do
    it 'handles valid move correctly' do
      tower.move(0,1)
      expect(tower.columns).to eq([[3,2],[1],[]])
      tower.move(1,2)
      expect(tower.columns).to eq([[3,2],[],[1]])
      tower.move(0,1)
      expect(tower.columns).to eq([[3],[2],[1]])
      tower.move(2,0)
      expect(tower.columns).to eq([[3,1],[2],[]])
    end

    it 'raises error if larger ring placed on smaller' do
      tower.move(0,1)
      expect{tower.move(0,1)}.to raise_error("can't do that buddy")
    end

    it 'raises error if no ring at starting position' do
      expect{tower.move(2,0)}.to raise_error("can't do that buddy")
    end

    it 'raises error if start or end not in bounds' do
      expect {tower.move(4,4)}.to raise_error("can't do that buddy")
    end
  end

  describe '#won?' do
    it 'returns true if board is over' do
      tower.columns = [[],[],[3,2,1]]
      expect(tower.won?).to eq(true)
      tower.columns = [[],[3,2,1],[]]
      expect(tower.won?).to eq(true)
    end

    it 'doesnt return true if board is in first column' do
      expect(tower.won?).to eq(false)
    end
  end

end#class
