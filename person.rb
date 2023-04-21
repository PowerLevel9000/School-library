require './nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def parent_permission?
    @parent_permission
  end

  def rental
    if @rental.empty?
      "This person doesn't have any books."
    else
      @rental.map { |rental| rental.book.title }.join(", ")
    end
  end
  
  def add_rental(book, date)
    Rental.new(date, book, self)
    @rental << rental
  end

  private

  def of_age?
    @age >= 18
  end
end
