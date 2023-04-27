require 'json'
def add_book_to_json
  books_array = File.exist?("books.json") ? JSON.parse(File.read('books.json')) : []
  File.write('books.json', JSON.pretty_generate(books_array))
end
def add_person_to_json
  person_array = File.exist?("person.json") ? JSON.parse(File.read('person.json')) : []
  person_array << { id: @id, age: @age, name: @name, parent_permission: @parent_permission}
  File.write('person.json', JSON.pretty_generate(person_array))
end
def add_rental_to_json
  rental_array = File.exist?("rentals.json") ? JSON.parse(File.read('rentals.json')) : []
  rental_array << { date: @date, book: @book, person: @person }
  File.write('rentals.json', JSON.pretty_generate(rental_array))
end

def json_reader(file)
  if File.exist?("#{file}.json")
    File.open("#{file}.json", 'r') do |f|
      data = JSON.parse(f.read)
    return data
    end
  else
    return []
  end
  
end