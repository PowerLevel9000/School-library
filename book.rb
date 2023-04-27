require './rental'
require './data-controler/data_presever'

class Book
  attr_accessor :title, :author, :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
    # add_book_to_json
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
