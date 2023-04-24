require_relative 'person'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'classroom'

class App
  def initialize
    @classroom = []
    @books = []
    @rentals = []
    @person = []
  end

  def exit
    ui_creater('THANKS FOR USING OUR APPLICATION')
  end

  def ui_creater(prop)
    puts "-----------------------------------------\n#{prop} \n-----------------------------------------"
  end

  def table_ui(table_title, line)
    puts "========================== #{table_title} =========================="
    puts line
    puts "========================== *************** =========================="
  end

  def list_all_books
    if @books.length.positive?
      line = ""
      @books.each do |book|
        line += "#{book.title.upcase} by #{book.author.upcase} \n"
      end
      ui_creater(line)
    else
      ui_creater('we do not have any book please create one')
    end
  end

  def list_all_person
    puts '****** List of persons *******'
    if @person.length.positive?
      lines = ""
      @person.each do |person|
        if person.respond_to?('specialization')
          lines += "#{person.name.upcase}, he is #{person.age} years old, specilites in #{person.specialization}\n"
        else
          lines += "#{person.name.upcase}, he is #{person.age} years old, study in #{person.classroom.label} \n"
        end
      end
      ui_creater(lines)
    else
      ui_creater("we got a problem we don't have anyone in our school")
    end
  end

  def create_a_person
    puts '******* Select another option ***********'
    puts '1. To create a student'
    puts '2. To create a teacher'
    print 'Enter the option : '
    person_category = gets.chomp.to_i
    if person_category < 1 or person_category > 2
      ui_creater('invalid option for creating person')
      return
    end
    print 'Enter name: '
    name = gets.chomp
    print 'Enter age: '
    age = gets.chomp
    detial_person(person_category, name, age)
  end

  def detial_person(category, name, age)
    if category == 1
      print 'Enter classroom: '
      classroom = gets.chomp
      print 'Have parent permission? Y/N: '
      parent_permission = gets.chomp
      parent_permission = parent_permission.downcase == 'y'
      classroom = Classroom.new(classroom)
      fresh_student = Student.new(age, classroom, name, parent_permission: parent_permission)
      @person.push(fresh_student)
      ui_creater('New student created successfully')
    else
      print 'Enter specialization: '
      specialization = gets.chomp
      new_teacher = Teacher.new(age, specialization, name)
      @person.push(new_teacher)
      ui_creater('New teacher created successfully')
    end
  end

  def create_a_book
    print 'Enter the title of the book: '
    title = gets.chomp
    print 'Enter the author of the book: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    ui_creater("created book successfully with title of #{new_book.title.upcase} authored by #{new_book.author.upcase}")
  end

  def create_rental
    if @books.empty? || @person.empty?
      return ui_creater('There are no books available or registered person at the moment for rental')
    end

    puts 'Select a book from the shelf: '
    puts ''
    title = "Book Shelf"
    line = ""
    @books.each_with_index do |book, index|
      line += "#{index} Title #{book.title}, authored by #{book.author} \n"
    end
    table_ui(title,line)
    choice_book = @books[gets.chomp.to_i]
    puts 'Select a person to rent the book by id: '
    puts '=============== persons ==============='
    @person.each_with_index do |person, index|
      puts "#{index} #{person.name.upcase} with id #{person.id} and #{person.age} years old"
    end
    choice_person = @person[gets.chomp.to_i]
    print 'Enter date of rental to keep track of book : '
    date = gets.chomp
    rental = Rental.new(date, choice_book, choice_person)
    ui_creater("#{rental.person.name} record for #{rental.book.title} has been created saved successfully")
  end

  def list_all_rentals_by_id
    display_persons
    id = person_id_from_user_input
    person = find_person_by_id(id)
    display_rentals_by_person(person)
  end

  def display_persons
    puts '******* Select option i.e. person id ***********'
    puts '========================== person ======================'
    @person.each { |person| puts "ID: #{person.id}, Name: #{person.name.upcase} and Age #{person.age}" }
    puts '========================== ******* ======================'
  end

  def person_id_from_user_input
    print 'Enter person ID: '
    gets.chomp.to_i
  end

  def find_person_by_id(id)
    @person.find { |item| item.id == id }
  end

  def display_rentals_by_person(person)
    puts "========================== rentals by #{person.name.upcase} ==============================="
    if person&.rentals&.any?
      person.rentals.each do |item|
        puts "Book: #{item.book.title.upcase} authored by #{item.book.author.upcase} on the date #{item.date}"
      end
    else
      puts 'No rentals available at the moment'
    end
    puts '========================== ***************************************** ======================'
  end
end
