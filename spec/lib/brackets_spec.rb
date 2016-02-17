require 'brackets'

describe Brackets do
  describe '.balanced?' do
    it 'is true with balanced parens' do
      expect(described_class.balanced?('()')).to be true
    end

    it 'is false with unbalanced parens' do
      expect(described_class.balanced?('(()')).to be false
    end

    it 'is true with nested parens' do
      expect(described_class.balanced?('(())')).to be true
    end

    it 'is true with parens in series' do
      expect(described_class.balanced?('()()')).to be true
    end

    it 'is false with inverted parens' do
      expect(described_class.balanced?(')(')).to be false
    end

    it 'is false with unbalanced square brackets' do
      expect(described_class.balanced?('[]]')).to be false
    end

    it 'is false with unbalanced braces' do
      expect(described_class.balanced?('{}}')).to be false
    end

    it 'is false with mismatched brackets' do
      expect(described_class.balanced?('({}}')).to be false
    end

    it 'is false with disordered brackets' do
      expect(described_class.balanced?('({)}')).to be false
    end
  end
end
