require 'tdd'
require 'rspec'

describe Array do

  describe '#my_uniq' do

    let(:my_array) { [1,2,1,3,3]}
    let(:my_uniq_array) { [1,2,3] }

    it 'returns an array' do
      expect(my_array.my_uniq).to be_instance_of(Array)
    end

    context 'when passed empty array' do
      it 'returns empty array' do
        expect([].my_uniq).to eq([])
      end
    end

    it 'removes duplicate elements' do
      expect(my_array.my_uniq).to eq(my_array.uniq)
    end

    context 'when array does not contain duplicate elements' do
      it 'returns copy of original array' do
        expect(my_uniq_array.my_uniq).to eq(my_uniq_array.uniq)
      end
    end

    it 'does NOT call the built in Array#uniq' do
      expect(my_uniq_array).not_to receive(:uniq)
    end

    it 'does not modify original array' do
      duped_array = my_uniq_array.dup
      duped_array.my_uniq
      expect(duped_array).to eq(my_uniq_array)
    end

  end

  describe '#two_sum' do

    let(:standard) { [-1,0,2,-2,1] }

    it 'returns an array' do
      expect(standard.two_sum).to be_instance_of(Array)
    end

    context 'when passed empty array' do
      it 'returns empty array' do
        expect([].two_sum).to eq([])
      end
    end

    it 'does not modify original array' do
      duped_array = standard.dup
      duped_array.two_sum
      expect(duped_array).to eq(standard)
    end

    it 'returns sorted index pairs and no spurious pairs' do
      expect(standard.two_sum).to eq([[0, 4], [2, 3]])
    end

    it 'handles an array containing two zeroes' do
      expect([-1,0,2,0].two_sum).to eq([[1,3]])
    end

    it 'handles an array with two pairs that use the same element' do
      expect([-1,0,1,-2,1].two_sum).to eq([[0,2],[0,4]])
    end

    it 'handles an array with no pairs' do
      expect([1,2,3,4].two_sum).to eq([])
    end

  end

  describe '#my_transpose' do

    context 'when passed empty array' do
      it 'returns empty array' do
        expect([].my_transpose).to eq([])
      end
    end

    it 'correctly transposes an array' do
        array = [[0, 1, 2],[3, 4, 5],[6, 7, 8]]
        answer = [[0, 3, 6],[1, 4, 7],[2, 5, 8]]
        expect(array.my_transpose).to eq(answer)
    end
  end

  describe 'stock_picker' do

      it 'handles case where lowest price is after highest price' do
        expect([100,98,102,90,95,110,50].stock_picker).to eq([3,5])
      end

      it 'handles a simple case' do
        expect([100, 101, 102, 103, 104].stock_picker).to eq([0,4])
      end

  end




end#class
