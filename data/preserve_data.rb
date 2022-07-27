require 'json'
require './person'
require './student'
require './classroom'
require './teacher'
require './rental'
require './book'

def load_people(mypeople)
  if File.exist?('./data/people.json')
    file = File.open('./data/people.json')

    if File.empty?('./data/people.json')
      mypeople << []
    else
      people = JSON.parse(File.read('./data/people.json'))
      # p people.length()
      people.each do |person|
        # p person
        mypeople << if person['type'] == 'Student'
                      Student.new(person['name'], person['age'], person['parent_permission'])
                    else
                      Teacher.new(person['name'], person['age'], person['specialization'], person['parent_permission'])
                    end
      end
    end
    file.close
  else
    mypeople << []
  end
end

def load_books(mybook)
  if File.exist?('./data/books.json')
    file = File.open('./data/books.json')

    if file.size.zero?
      mybook << []
    else
      books = JSON.parse(File.read('./data/books.json'))

      books.each do |book|
        mybook << Book.new(book['name'], book['author'])
      end
    end
    file.close
  else
    mybook << []
  end
end

def load_rentals(myrental)
  if File.exist?('./data/rentals.json')
    file = File.open('./data/rentals.json')

    if file.size.zero?
      myrental << []
    else
      rentals = JSON.parse(File.read('./data/rentals.json'))

      rentals.each do |rental|
        myrental << Rental.new(rental['date'], @persons[rental['book']], @books[rental['person']])
      end
    end
    file.close
  else
    myrental << []
  end
end

def save_student(name, age, parent_permission)
  obj = {
    type: 'Student',
    name: name,
    age: age,
    parent_permission: parent_permission
  }

  if File.exist?('./data/people.json')
    file = File.open('./data/people.json')

    if file.size.zero?
      student = [obj]
    else
      student = JSON.parse(File.read('./data/people.json'))
      student << obj
    end

    file.close

    myfile = File.open('./data/people.json', 'w')
    myfile.write(JSON.pretty_generate(student))
    myfile.close
  end
end

def save_teacher(name, age, specialization)
  obj = {
    type: 'Teacher',
    specialization: specialization,
    name: name,
    age: age,
    parent_permission: true
  }

  if File.exist?('./data/people.json')
    file = File.open('./data/people.json')

    if file.size.zero?
      teacher = [obj]
    else
      teacher = JSON.parse(File.read('./data/people.json'))
      teacher << obj
    end

    file.close

    myfile = File.open('./data/people.json', 'w')
    myfile.write(JSON.pretty_generate(teacher))
    myfile.close
  end
end

def save_book(name, author)
  obj = {
    name: name,
    author: author
  }

  if File.exist?('./data/books.json')
    file = File.open('./data/books.json')

    if file.size.zero?
      book = [obj]
    else
      book = JSON.parse(File.read('./data/books.json'))
      book << obj
    end

    file.close

    myfile = File.open('./data/books.json', 'w')
    myfile.write(JSON.pretty_generate(book))
    myfile.close
  end
end

def save_rental(date, book, person)
  obj = {
    date: date,
    person: person,
    book: book
  }

  if File.exist?('./data/rentals.json')
    file = File.open('./data/rentals.json')

    if file.size.zero?
      rental = [obj]
    else
      rental = JSON.parse(File.read('./data/rentals.json'))
      rental << obj
    end

    file.close

    myfile = File.open('./data/rentals.json', 'w')
    myfile.write(JSON.pretty_generate(rental))
    myfile.close
  end
end
