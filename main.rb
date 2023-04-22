require './app.rb'
require 'readline'

def ui
  input = 0
  app = App.new()
  puts "===================================================================="
  puts "********************* welcome to School Library ********************"
  puts "===================================================================="
  while input[-1].to_i != 7
    puts "******* Select option ***********"
    puts '1. List all books'
    puts '2. List all person'
    puts '3. creat person'
    puts '4. create books'
    puts '5. create rental'
    puts '6. List all rentals for a given person ID'
    puts '7. List all books'
    userInput = Readline.readline("enter you option : ", true);
    input = userInput
    case userInput[-1].to_i
    when 1
      app.list_all_books
    when 2
      app.list_all_person
    when 3
      app.create_a_person
    when 4
      app.create_a_book
    when 5
      app.create_rental
    when 6
      app.list_all_rentals_by_id
    when 7
      puts "thanks for using"
    else
      puts "choose a valid option 'try again'"
    end
  end
end
ui

