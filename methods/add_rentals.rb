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
