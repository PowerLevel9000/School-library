require 'spec_helper'

describe Person do
	let(:person) { Person.new(33, 'Burak', parent_permission: false)}
	let(:book) { Book.new('War and Peace', 'Lev Tolstoy')}

	it "returns person name" do
		expect(person.name).to eql('Burak')
	end


	it "returns person parent_permission" do
		expect(person.parent_permission).to eql(false)
	end
  
	id 'should return correct name ' do
	  name = person.correct_name
		expect(name).to eql('Burak')
	end 

	it 'creates a rental with the correct book, person, and date' do
		rental = book.add_rental(person, "2023-04-28")
		expect(rental.book).to eq(book)
		expect(rental.person).to eq(person)
		expect(rental.date).to eq("2023-04-28")
	end


	it "returns the persons age 18 or greater" do
			expect(person.can_use_services?).to be_truthy
	end


	it "returns the persons age 18 or greater" do
			expect(person.age).to be_truthy
	end


end