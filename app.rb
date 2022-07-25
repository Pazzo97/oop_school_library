require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './methods/add_person'
require_relative './methods/add_books'
require_relative './methods/add_rentals'

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
end
