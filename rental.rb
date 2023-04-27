require './person'
require './book'
require './data-controler/data_presever'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @person = person
    @book = book
  end
end
