require './person.rb'
require './book.rb'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @person = person
    @book = book
    book.rental << self 
    person.rental << self
  end
end
