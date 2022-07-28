require_relative '../rental'

describe Rental do
  rental = Rental.new('2022/07/27', Book.new('The Hobbit', 'J. R. R. Tolkien'), Person.new('Patrick'))

  it 'creates a new rental' do
    expect(rental).to be_an_instance_of Rental
  end

  it 'Rental has a date' do
    expect(rental.date).to eq '2022/07/27'
  end

  it 'Rental has a book' do
    expect(rental.book).to be_an_instance_of Book
  end

  it 'Rental has a person' do
    expect(rental.person).to be_an_instance_of Person
  end
end
