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
    puts '1. List all book'
    puts '2. List all person'
    puts '3. Create person'
    puts '4. Create book'
    puts '5. Create rental'
    puts '6. List all rentals for a given person ID'
    puts '7. List all books'
    userInput = Readline.readline("Enter you option : ", true);
    input = userInput
    case userInput[-1].to_i
    when 1
      app.list_all_books
      puts ''
      puts '////////////////////// task end ///////////////////////'
      puts ''
    when 2
      app.list_all_person
      puts ''
      puts '////////////////////// task end ///////////////////////'
      puts ''
    when 3
      app.create_a_person
      puts ''
      puts '////////////////////// task end ///////////////////////'
      puts ''
    when 4
      app.create_a_book
      puts ''
      puts '////////////////////// task end ///////////////////////'
      puts ''
    when 5
      app.create_rental
      puts ''
      puts '////////////////////// task end ///////////////////////'
      puts ''
    when 6
      app.list_all_rentals_by_id
      puts ''
      puts '////////////////////// task end ///////////////////////'
      puts ''
    when 7
      puts "thanks for using"
    else
      puts "choose a valid option 'try again'"
    end
  end
end
ui

