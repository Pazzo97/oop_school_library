class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    add_book(book)
    add_person(person)
  end

  def add_book(book)
    @book = book
    book.rentals << self
  end

  def add_person(person)
    @person = person
    person.rentals << self
  end
end
