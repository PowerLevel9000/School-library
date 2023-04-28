require 'spec_helper'

describe Book do
  let(:book) { Book.new('War and Peace', 'Lev Tolstoy')}
  let(:person) { Person.new ('Adarsh')}
  

  it "returns the book title" do
      expect(book.title).to eql('War and Peace')
  end

  it "returns the author title" do
      expect(book.author).to eql('Lev Tolstoy')
  end

  it 'creates a rental with the correct book, person, and date' do
    rental = book.add_rental(person, "2023-04-28")
    expect(rental.book).to eq(book)
    expect(rental.person).to eq(person)
    expect(rental.date).to eq("2023-04-28")
  end
end