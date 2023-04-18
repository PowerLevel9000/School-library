require './person.rb'

class Teacher < Person
    attr_accessor :specialization
    def initialize (name, age,  specialization, parent_permission:true)
        super(name, age,parent_permission: parent_permission)
        @specialization = specialization
    end

    def can_use_services 
        return true
    end
end

adarsh_pro = Teacher.new("Adarsh Pro", 12, "Sciennce And Maths")
puts "################################ teacher.rb file ########################"
puts adarsh_pro.name, adarsh_pro.can_use_services, adarsh_pro.specialization