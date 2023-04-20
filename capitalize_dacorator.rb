require './decorator.rb'
require './person.rb'

class Capitalize < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
puts "#########################3 capatalize_decorator.rb file ###################"
person = Person.new(22, 'maximilianus')
capitalize1 = Capitalize.new(person)

# Again this could raise a error 
begin
    puts capitalize1.correct_name
  rescue NotImplementedError => e
    puts e.message
end