require 'spec_helper'

describe Person do
let(:person) { Person.new(33, 'Burak', parent_permission: false)}
let(:book) { Book.new('War and Peace', 'Lev Tolstoy')}

describe "#name" do
    it "returns person name" do
        expect(person.name).to eql('Burak')
    end
end

describe "#parent_permission" do
    it "returns person parent_permission" do
        expect(person.parent_permission).to eql(false)
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

  describe "#can_use_services?" do
    it "returns the persons age 18 or greater" do
        expect(person.can_use_services?).to eql(true)
    end
end

describe "#age" do
    it "returns the persons age 18 or greater" do
        expect(person.age).to be_truthy
    end
end

end