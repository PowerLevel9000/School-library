require './person'
require './decorator'

class Trimmer < Decorator
  def correct_name
    @nameable.correct_name.length > 10 ? @nameable.correct_name[0...10] : @nameable.correct_name
  end
end

puts '#################### trimmer_decorator.rb file ###########################'
person = Person.new(22, 'maximilianus')
capitalized_trimmed_person = Trimmer.new(person)
puts capitalized_trimmed_person.correct_name
