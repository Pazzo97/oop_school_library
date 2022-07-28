require_relative '../decorator'

describe Decorator do
  describe '#correct_name' do
    decorator = Decorator.new(Nameable.new)
    it 'returns the correct name' do
      expect(decorator.correct_name('patrick')).to eq 'Patrick'
    end
  end
end
