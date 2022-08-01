require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './methods/add_person'
require_relative './methods/add_books'
require_relative './methods/add_rentals'
require './data/preserve_data'

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

  def load_data
    load_people
    puts
    load_books
    puts
    load_rentals
  end

  private

  def action(action)
    action_list = { 1 => 'list_books', 
                    2 => 'list_people', 
                    3 => 'add_person', 
                    4 => 'add_book', 
                    5 => 'add_rental',
                    6 => 'list_rentals_by_person_id', 
                    7 => 'exit' 
                  }

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

  def validate_teacher_inputs(name, age, specialization)
    name_check = !name.empty? && name.is_a?(String)
    age_check = age > 18 && age.is_a?(Integer)
    specialization_check = !specialization.empty? && specialization.is_a?(String)
    return unless name_check && age_check && specialization_check

    teacher = Teacher.new(specialization, age, name)
    @persons << teacher
    save_teacher(name, age, specialization)

    puts "Teacher with id #{teacher.id} successfully created"
  end

  def validate_student_inputs(name, age, parent_permission)
    name_check = !name.empty? && name.is_a?(String)
    age_check = age > 18 && age.is_a?(Integer)
    parent_permission_check = parent_permission.is_a?(String)
    return unless name_check && age_check && parent_permission_check

    student = Student.new(age, name, parent_permission: parent_permission)
    @persons << student
    save_student(name, age, parent_permission)

    puts "Student with id #{student.id} successfully created"
  end

  def validate_book_inputs(name, author)
    name_check = !name.empty? && name.is_a?(String)
    author_check = !author.empty? && author.is_a?(String)
    return unless name_check && author_check

    book = Book.new(name, author)
    @books << book
    save_book(name, author)

    puts 'Book is successfully created'
  end

  def validate_rental_inputs(date, book, person)
    date_check = !date.empty?
    book_check = book.is_a?(Integer)
    person_check = person.is_a?(Integer)
    return unless date_check && book_check && person_check

    rental = Rental.new(date, @books[book], @persons[person])
    @rentals << rental
    save_rental(date, @books[book], @persons[person])
    puts 'Rental created successfully'
  end
  # rubocop:enable Style/Next
end
