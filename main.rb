require_relative './app'

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

def main
  app = App.new
  app.load_data
  app.run
end

main
