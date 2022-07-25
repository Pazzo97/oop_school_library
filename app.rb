require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './methods/add_person'

class App
  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  def run
    actions.each { |key, value| puts "#{key}: #{value}" }
    action = gets.chomp.to_i
    action(action)
  end

  private

  def action(action)
    action_list = { 1 => 'list_books', 2 => 'list_people', 3 => 'add_person', 4 => 'add_book', 5 => 'add_rental',
                    6 => 'list_rentals_by_person_id', 7 => 'exit' }

    if action_list.key?(action)
      send(action_list[action])
    else
      puts 'Invalid input!'
    end

    run # List actions once the user is done with the current action
  end


  def list_people(show_index: false)
    @persons.each_with_index do |person, index|
      result = "[#{person.class.name}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      result = "#{index}) " + result if show_index
      puts result
    end
  end

  def list_books(show_index: false)
    @books.each_with_index do |book, index|
      result = "Title: \"#{book.title}\", Author: #{book.author}"
      result = " #{index}) " + result if show_index
      puts result
    end
  end

  def add_book
    print 'Enter the name of the book: '
    name = gets.chomp.to_s
    print 'Enter the author of the book: '
    author = gets.chomp.to_s
    book = Book.new(name, author)
    @books << book
    puts 'Book created successfully'
  end

  # rubocop:disable Style/Next

  def list_rentals_by_person_id
    puts 'No person entry found' if @persons.empty?
    print 'Enter person ID: '
    id = gets.chomp.to_i
    @persons.each do |person|
      if person.id == id
        puts 'Rentals:'
        person.rentals.each do |rental|
          puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author} "
        end
      end
    end
  end
  # rubocop:enable Style/Next

  def add_rental
    puts 'Select a book from the following list by number'
    list_books(show_index: true)
    book = gets.chomp.to_i
    puts 'Invalid input!' if !(book.is_a? Integer) && book >= @books.length

    puts 'Select a person from the following list by number (not id)'
    list_people(show_index: true)
    person = gets.chomp.to_i
    puts 'Invalide input!' if !(person.is_a? Integer) && person >= @people.length

    print 'Please enter the date: '
    date = gets.chomp.to_s

    Rental.new(date, @books[book], @persons[person])

    puts 'Rental created successfully'
  end
end
