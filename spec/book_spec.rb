require 'spec_helper'

describe Book do
  let(:book) { Book.new('War and Peace', 'Lev Tolstoy')}
  let(:person) { Person.new ('Adarsh')}
  

    describe "#title" do
        it "returns the book title" do
            expect(book.title).to eql('War and Peace')
        end
    end

    describe "#author" do
        it "returns the author title" do
            expect(book.author).to eql('Lev Tolstoy')
        end
    end

    describe '#add_rental' do
        it 'creates a rental with the correct book, person, and date' do
          rental = book.add_rental(person, "2023-04-28")
          expect(rental.book).to eq(book)
          expect(rental.person).to eq(person)
          expect(rental.date).to eq("2023-04-28")
        end
      end

end