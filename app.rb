require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

class App
  def initialize
    @persons = []
    @books = []
  end

  def run
    actions.each { |key, value| puts "#{key}: #{value}" }
    action = gets.chomp.to_i
    action(action)
  end

  private

  def actions
    puts # Add a blank line before the actions list
    {
      1 => 'List all books',
      2 => 'List all people',
      3 => 'Create a person',
      4 => 'Create a book',
      5 => 'Create a rental',
      6 => 'List all rentals for a given person id',
      7 => 'Exit'
    }
  end

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

  def add_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp.to_i

    puts 'Invalide input' if type != 1 && type != 2
    add_student if type == 1 # Create a student if the user entered 1
    add_teacher if type == 2 # Create a teacher if the user entered 2
  end

  def list_people(show_index: false)
    @persons.each_with_index do |person, index|
      result = "[#{person.class.name}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      result = "#{index}) " + result if show_index
      puts result
    end
  end

  def add_student
    print 'Enter the name of the student: '
    name = gets.chomp.to_s
    print 'Enter the age of the student: '
    age = gets.chomp.to_i
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.to_s.downcase == 'y'
    student = Student.new(age, name, parent_permission: parent_permission)
    @persons << student

    puts "Student with id #{student.id} created"
  end

  def add_teacher
    print 'Enter the name of the teacher: '
    name = gets.chomp.to_s
    print 'Enter the age of the teacher: '
    age = gets.chomp.to_i
    print "And teacher's specialization: "
    specilization = gets.chomp.to_s
    teacher = Teacher.new(specilization, age, name)
    @persons << teacher

    puts "Student with id #{teacher.id} created"
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

  def list_rentals_by_person_id
    puts 'No person entry found' if @persons.empty?
    print 'Enter person ID: '
    id = gets.chomp.to_i
    @persons.each do |person|
      if person.id == id
        person.rentals.each do |rental|
          puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author} "
        end
      else
        puts "No rentals found for person with id #{id}"
      end
    end
  end

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
