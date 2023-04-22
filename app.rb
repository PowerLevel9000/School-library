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
			puts '----------------------------------'
      @books.each do |book|
        puts "#{book.title.upcase} by #{book.author.upcase}"
      end
			puts '----------------------------------'
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
			puts '-------------------------------------------------------------------------------------'
      @person.each do |person|
        if person.respond_to?('specialization')
          puts "#{person.name}, he is #{person.age} years old, specilites in #{person.specialization} "
        else
          puts "#{person.name}, he is #{person.age} years old, study in #{person.classroom.label}"
        end
      end
			puts '-------------------------------------------------------------------------------------'

    else
			puts '----------------------------------------------------'
      puts "we got a problem we don't have anyone in our school"
			puts '----------------------------------------------------'
    end
  end

  def create_a_person
		puts "******* Select another option ***********"
    puts '1. To create a student'
		puts '2. To create a teacher'
		print 'Enter the option : '
    person_category = gets.chomp.to_i
		if person_category < 1 or person_category > 2
			puts '----------------------------------'
      puts 'invalid option for creating person'
			puts '----------------------------------'
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
      puts 'Have parent permission? Y/N: '
      parent_permission = gets.chomp
      parent_permission = parent_permission.downcase == 'y'
      classroom = Classroom.new(classroom)
      fresh_student = Student.new(age, classroom, name, parent_permission: parent_permission)
      @person.push(fresh_student)
			puts '---------------------------------'
      puts 'New student created successfully'
			puts '---------------------------------'
    else
      print 'Enter specialization: '
      specialization = gets.chomp
      new_teacher = Teacher.new(age, specialization, name)
      @person.push(new_teacher)
			puts '----------------------------------'
      puts 'New teacher created successfully'
			puts '----------------------------------'
    end
  end

  def create_a_book
    print 'Enter the title of the book: '
    title = gets.chomp
    print 'Enter the author of the book: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
		puts '--------------------------------------------------------------------------------------------------------'
    puts "created book successfully with title of #{new_book.title.upcase} authored by #{new_book.author.upcase}"
		puts '---------------------------------------------------------------------------------------------------------'

  end

  def create_rental
    if @books.empty? or @person.empty?
			puts '------------------------------------------------------------------------'
      puts 'There are  books available or registered person at the moment for rental'
			puts '------------------------------------------------------------------------'
      return
    end
		puts "******* Select option ***********"
    puts 'Select a book from the shelf: '
    puts ''
		puts '=============== book self ==============='
    @books.each_with_index do |book, index|
      puts "#{index} Title #{book.title}, authored by #{book.author}"
    end
		puts '=============== ************ ==============='
    choice_book = gets.chomp
    choice_book = @books[choice_book.to_i]
		puts "******* Select option ***********"
    puts 'Select a person to rent the book by id: '
    puts ''
		puts '=============== persons ==============='

    @person.each_with_index do |person, index|
      puts "#{index} #{person.name.upcase} with id #{person.id} and #{person.age} years old"
    end
		puts '=============== ******* ==============='
    choice_person = gets.chomp
    choice_person = @person[choice_person.to_i]
    print 'Enter date of rental to keep track of book : '
    date = gets.chomp
    rental = Rental.new(date, choice_book, choice_person)
		puts '------------------------------------------------------------------------------'
    puts "#{rental.person} record for #{rental.book} has been created saved successfully"
		puts '------------------------------------------------------------------------------'
  end

  def list_all_rentals_by_id
		puts "******* Select option i.e. person id ***********"
		puts '========================== person ======================'
    @person.each do |person|
      puts "ID: #{person.id}, Name: #{person.name.upcase} and Age #{person.age}"
    end
		puts '========================== ******* ======================'
    if @person.empty?
			puts '----------------------------------------------------'
      puts 'No rental record in the library, you can create one.'
			puts '----------------------------------------------------'
      return
    end
    print 'Enter person ID: '
    id = gets.chomp.to_i
    person = @person.find { |item| item.id == id }
		puts "========================== rentals by #{person.name.upcase} ==============================="
    if person and person.rentals.length.positive?
      person.rentals.each do |item|
        puts "Book: #{item.book.title.upcase} authored by #{item.book.author.upcase} on the date #{item.date}"
      end
    else
      puts 'No rentals available at the moment'
    end
		puts '========================== ***************************************** ======================'
  end
end
