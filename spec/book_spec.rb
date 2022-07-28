require_relative '../book'

describe Book do
  context 'It should create book' do
    book = Book.new('Origin story', 'David Christian')
    it 'should create a new book' do
      expect(book.title).to eq 'Origin story'
      expect(book.author).to eq 'David Christian'
    end

    it 'should add a new rentals' do
      book.add_rental(book)
      expect(book.rentals.length).to eq 1
    end
  end
end
