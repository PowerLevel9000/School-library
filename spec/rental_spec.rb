require 'spec_helper'

describe Rental do
	it "sets the rental date,book,person" do
		date = '2022-01-01'
		book = { 'title' => 'Transformation', 'author' => 'Kafka', 'rentals' => [] }
		person = { 'name' => 'Burak', 'age' => 25, 'parent_permission' => true, 'rentals' => [] }
		rental = Rental.new(date, book, person)
		expect(rental.date).to eq date
		expect(rental.book).to eq book
		expect(rental.person).to eq person
	end
end