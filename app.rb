require_relative 'person'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'classroom'
require './ui_creater'
require './data-controler/data_presever'

class App < UiCreater
  attr_accessor :books, :rentals, :person

  def initialize
    super()
    @classroom = data_loader('classroom')
    @books = data_loader('books')
    @rentals = data_loader('rentals')
    @person = data_loader('person')
  end

  def exit_and_save
    File.write('./data-controler/data/books.json', JSON.pretty_generate(@books))
    File.write('./data-controler/data/person.json', JSON.pretty_generate(@person))
    File.write('./data-controler/data/rentals.json', JSON.pretty_generate(@rentals))
    File.write('./data-controler/data/classroom.json', JSON.pretty_generate(@classroom))
    ui_creater('THANKS FOR USING OUR APPLICATION')
  end

  def list_all_books
    if @books.length.positive?
      title = 'Book Shelf'
      line = ''
      @books.each do |book|
        line += "#{book['title'].upcase} by #{book['author'].upcase} \n"
      end
      table_ui(title, line)
    else
      ui_creater('we do not have any book please create one')
    end
  end

  def list_all_person
    if @person.length.positive?
      title = 'List of persons'
      lines = ''
      @person.each do |person|
        lines += if person.key?('specialization')
                   "#{person['name'].upcase}, he is
                   #{person['age']} years old, specilites in #{person['specialization'].upcase}\n"
                 else
                   "#{person['name'].upcase}, he is #{person['age']} years old, study in #{person['classroom']} \n"
                 end
      end
      table_ui(title, lines)
    else
      ui_creater("we got a problem we don't have anyone in our school")
    end
  end

  def create_a_person
    title_ui
    create_a_person_ui
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
      @person.push({ 'id' => fresh_student.id, 'age' => fresh_student.age, 'classroom' => classroom.label,
                     'name' => fresh_student.name, 'parent_permission' => fresh_student.parent_permission })
      ui_creater('New student created successfully')
    else
      print 'Enter specialization: '
      specialization = gets.chomp
      new_teacher = Teacher.new(age, specialization, name)
      @person.push({ 'id' => new_teacher.id, 'age' => new_teacher.age, 'specialization' => new_teacher.specialization,
                     'name' => new_teacher.name })
      ui_creater('New teacher created successfully')
    end
  end

  def create_a_book
    print 'Enter the title of the book: '
    title = gets.chomp
    print 'Enter the author of the book: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push({ 'title' => new_book.title, 'author' => new_book.author })
    ui_creater("created book successfully with title of #{new_book.title.upcase} authored by #{new_book.author.upcase}")
  end

  def person_table
    title2 = 'Persons'
    line2 = ''
    @person.each_with_index do |person, index|
      line2 += "#{index} #{person['name'].upcase} with id #{person['id']} and #{person['age']} years old \n"
    end
    table_ui(title2, line2)
  end

  def create_rental
    if @books.empty? || @person.empty?
      return ui_creater('There are no books available or registered person at the moment for rental')
    end

    puts 'Select a book from the shelf: '
    puts ''
    book_table
    choice_book = finder(@books)
    puts 'Select a person to rent the book by index: '
    person_table
    choice_person = finder(@person)
    print 'Enter date of rental to keep track of book : '
    date = gets.chomp
    rental = Rental.new(date, choice_book['title'], choice_person['name'])
    @rentals.push({ 'id' => choice_person['id'], 'date' => date, 'title' => choice_book['title'],
                    'name' => choice_person['name'] })
    ui_creater("#{rental.person} record for #{rental.book} has been created saved successfully")
  end

  def list_all_rentals_by_id
    if @rentals.empty?
      puts 'no rental here'
      return
    end
    display_persons
    id = person_id_from_user_input
    display_rentals_by_person_id(id)
  end

  def display_persons
    title_ui('i.e. person id')
    title = 'Person'
    line = ''
    @person.each do |person|
      line += "ID: #{person['id']}, Name: #{person['name'].upcase} and Age #{person['age']} \n"
    end
    table_ui(title, line)
  end

  def person_id_from_user_input
    print 'Enter person ID: '
    gets.chomp.to_i
  end

  def find_person_by_id(id)
    @person.find { |item| item['id'] == id }
  end

  def display_rentals_by_person_id(id)
    arr = []
    @rentals.each do |rental|
      arr << rental if rental['id'] == id
    end
    puts arr
  end
end
