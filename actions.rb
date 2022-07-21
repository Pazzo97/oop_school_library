require_relative './person'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'
require_relative './student'
require_relative './classroom'
require_relative './rental'
require_relative './book'

# person = Person.new(22, 'maximilianus')
# puts person.correct_name
# capitalized_person = CapitalizeDecorator.new(person)
# puts capitalized_person.correct_name
# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# puts capitalized_trimmed_person.correct_name

student = Student.new(Classroom.new('1A'), 22, 'maximilianus')
p student
p student.classroom

book = Book.new('Invisible Child', 'Andrea Elliott')
rental = Rental.new('2018-01-01', student, book)

p book.rentals.first.person.age
p book.rentals.first.date
p rental.book.author
