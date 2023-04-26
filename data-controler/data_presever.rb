require 'json'
def add_book_to_json
  books_array = File.exist?("./data/books.json") ? JSON.parse(File.read('./data/books.json')) : []
  books_array << { title: @title, author: @author}
  File.write('./data/books.json', JSON.pretty_generate(books_array))
end
def add_person_to_json
  person_array = File.exist?("./data/person.json") ? JSON.parse(File.read('./data/person.json')) : []
  person_array << { id: @id, age: @age, name: @name, parent_permission: @parent_permission}
  File.write('./data/person.json', JSON.pretty_generate(person_array))
end
def add_rental_to_json
  rental_array = File.exist?("./data/rentals.json") ? JSON.parse(File.read('./data/rentals.json')) : []
  rental_array << { date: @date, book: @book, person: @person }
  File.write('./data/rentals.json', JSON.pretty_generate(rental_array))
end

def json_reader(file)
  if File.exist?("./data/#{file}.json")
    File.open("./data/#{file}.json", 'r') do |f|
      data = JSON.parse(f.read)
    return data
    end
  else
    return []
  end
  
end