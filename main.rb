require './app'
require 'readline'

class UiGenrator
  attr_reader :options

  def initialize
    @options = {
      '1' => :list_all_books,
      '2' => :list_all_person,
      '3' => :create_a_person,
      '4' => :create_a_book,
      '5' => :create_rental,
      '6' => :list_all_rentals_by_id,
      '7' => :exit_and_save
    }
  end

  def main
    app = App.new
    breaker = 0
    putters
    while breaker != 7
      putter_ui
      user_input = Readline.readline('Enter option: ', true)
      breaker = user_input.to_i
      option = options[user_input[-1]]
      if option
        app.send(option)
        puts "\n// task end //\n\n"
      else
        puts 'Choose valid option.'
      end
    end
  end

  private

  def putters
    puts '===================================================================='
    puts '********************* welcome to School Library ********************'
    puts '===================================================================='
  end

  def putter_ui
    puts '******* Select option ***********'
    puts '1. List all book'
    puts '2. List all person'
    puts '3. Create person'
    puts '4. Create book'
    puts '5. Create rental'
    puts '6. List all rentals'
    puts '7. Exit'
  end
end
school_library = UiGenrator.new
school_library.main
