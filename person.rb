class Person
  attr_accessor :id, :name, :age
  def initialize(name = 'Unknown', age, parent_permission: true)
    @id = rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  
  def can_use_services
    return of_age
  end

  def parent_permission?
    return @parent_permission
  end

  private 

  def of_age
    return @age >= 18
  end
end

adarsh = Person.new("Adarsh", 21)
can_use_services = adarsh.can_use_services
puts can_use_services, adarsh.age, adarsh.id, adarsh.parent_permission? ,adarsh.name 


#  we can't find use of_age since it is private funtion so below line give you the error
# puts of_age?