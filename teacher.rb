require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'unkown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end

adarsh_pro = Teacher.new('Adarsh Pro', 12, 'Sciennce And Maths')
puts '################################ teacher.rb file ########################'
puts adarsh_pro.name, adarsh_pro.can_use_services, adarsh_pro.specialization
