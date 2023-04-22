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

  def list_all_books
    if @books.length.positive?
      @books.each do |book|
				puts '-----------------------------------------'
        puts "#{book.title} by #{book.author}"
				puts '-----------------------------------------'
      end
    else
			puts '-----------------------------------------'
      puts 'we do not have any book please create one'
			puts '-----------------------------------------'
    end
		return
  end

  def list_all_person
    puts '****** List of persons *******'
    if @person.length.positive?
      @person.each do |person|
        if person.respond_to?('specialization')
					puts '-------------------------------------------------------------------------------------'
          puts "#{person.name}, he is #{person.age} years old, specilites in #{person.specialization} "
					puts '-------------------------------------------------------------------------------------'
        else
					puts '-----------------------------------------------------------------------------'
          puts "#{person.name}, he is #{person.age} years old, study in #{person.classroom}"
					puts '-------------------------------------------------------------------------------'
        end
      end
    else
			puts '----------------------------------------------------'
      puts "we got a problem we don't have anyone in our school"
			puts '----------------------------------------------------'
    end
  end

  def create_a_person
		puts "******* Select another option ***********"
    puts '1. To create a studen '
		puts '2. To create a teacher'
    person_category = gets.chomp.to_i
    print 'Enter name:'
    name = gets.chomp
    print 'Enter age:'
    age = gets.chomp
    detial_person(person_category, name, age)
  end

  def detial_person(category, name, age)
    if category == 1
      print 'Enter classroom:'
      classroom = gets.chomp
      print 'Have parent permission? Y/N:'
      parent_permission = gets.chomp
      parent_permission = parent_permission.downcase == 'y'
      classroom = Classroom.new(classroom)
      fresh_student = Student.new(classroom, age, name, parent_permission: parent_permission)
      @person.push(fresh_student)
			puts '-----------------------------------------'
      puts 'New student created successfully'
			puts '-----------------------------------------'
    elsif category == 2
      print 'Enter specialization:'
      specialization = gets.chomp
      new_teacher = Teacher.new(age, name, specialization)
      @person.push(new_teacher)
			puts '----------------------------------'
      puts 'New teacher created successfully'
			puts '----------------------------------'
    else
			puts '----------------'
      puts 'invalid option'
			puts '----------------'
    end
  end

  def create_a_book
    print 'Enter the title of the book:'
    title = gets.chomp
    print 'Enter the author of the book:'
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts "created book successfully with title of #{new_book.title} authored by #{new_book.author.upcase}"
  end

  def create_rental
    if @books.empty? or @person.empty?
      puts 'There are no books available or registered person at the moment'
      return
    end
    puts 'Select a book from the shelf from the following:'

    @books.each_with_index do |book, index|
      puts "#{index} Title #{book.title}, authored by #{book.author}"
    end
    choice_book = gets.chomp
    choice_book = @books[choice_book.to_i]
    puts 'Select a person to rent the book by id'
    @person.each_with_index do |person, index|
      puts "#{index} #{person.name.upcase} with id #{person.id} and #{person.age} years old"
    end

    choice_person = gets.chomp
    choice_person = @person[choice_person.to_i]

    puts 'Enter date of rental to keep track of book'

    date = gets.chomp
    rental = Rental.new(date, choice_book, choice_person)

    puts "#{rental} record for rented book saved successfully"
  end

  def list_all_rentals_by_id
    @person.each do |person|
      puts "ID: #{person.id}, Name: #{person.name.upcase} and Age #{person.age}"
    end

    if @person.empty?
      puts 'No rental record in the library, you can create one.'
      return

    end

    puts 'Enter person ID:'

    id = gets.chomp.to_i
    person = @person.find { |item| item.id == id }
    puts 'Book rentals'

    if person and person.rentals.length.positive?
      person.rentals.each do |item|
        puts "Name: #{person.name.upcase} Book: #{item.book.title} authored by #{item.book.author} on the date #{item.date}"
      end
    else
      puts 'No rentals available at the moment'
    end
  end
end
