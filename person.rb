require './nameable'
require './data-controler/data_presever'

class Person < Nameable
  attr_accessor :name, :age, :rentals, :parent_permission
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    # add_person_to_json
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

  def add_rental(book, date)
    rental = Rental.new(date, book, self)
    @rental << rental
  end

  private

  def of_age?
    @age >= 18
  end
end
