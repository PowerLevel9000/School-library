require './person.rb'
require './decorator.rb'

class Trimmer < Decorator
	def correct_name
		@nameable.correct_name.length > 10 ? @nameable.correct_name[0...10] : @nameable.correct_name
	end
end

puts "#################### trimmer_decorator.rb file ###########################"
person = Person.new(22, 'maximilianus')
capitalizedTrimmedPerson = Trimmer.new(person)
puts capitalizedTrimmedPerson.correct_name