require './person'
require './book'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @person = person
    @book = book
    book.rental << self
    person.rentals << self
  end
end
