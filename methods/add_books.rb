def add_book
  print 'Enter the name of the book: '
  name = gets.chomp.to_s
  print 'Enter the author of the book: '
  author = gets.chomp.to_s

  validate_book_inputs(name, author)
end
