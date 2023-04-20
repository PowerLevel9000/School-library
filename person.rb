require './nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age
  end

  def parent_permission?
    @parent_permission
  end

  private

  def of_age
    @age >= 18
  end
end

puts '########################## person.rb file #############################'


adarsh = Person.new(21, 'Adarsh', parent_permission: false)
can_use_services = adarsh.can_use_services?
puts can_use_services, adarsh.age, adarsh.id, adarsh.parent_permission?, adarsh.name, adarsh.id

#  we can't find use of_age since it is private funtion so below line give you the error
# puts of_age?

# Again this could raise a error
begin
  puts adarsh.correct_name
rescue NotImplementedError => e
  puts e.message
end
