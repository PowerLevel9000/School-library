require './person'
require './teacher'
require './student'
require './book'
require './rental'
# this will give you argumentive error since we have a default bollen attr
# adarsh = Person.new(18, "Adarsh", false)
adarsh = Person.new(12, 'Adarsh', parent_permission: false)
adarsh2 = Person.new(12, 'Adarsh', parent_permission: true)
puts '################# person puts obesrvation 1 ############################'
puts adarsh.name, adarsh.age, adarsh.can_use_services?, adarsh2.can_use_services?, adarsh.rental

puts '################# teacher puts obeservation 2 ##########################'
teacher1 = Teacher.new(52, 'science', 'the imposter')
puts teacher1.age, teacher1.name, teacher1.can_use_services?, teacher1.specialization

puts '################# Student puts obeservation 3 ##########################'
student1 = Student.new(12, 'science')
puts student1.age, student1.name, student1.can_use_services?, student1.play_hooky

puts '################# books puts obeservation 4 ##########################'
mr_wick = Book.new('Mr wick the cold murder', 'Jhon doe')
puts mr_wick.title, mr_wick.author

puts '################# Associations  puts obeservation 5 ##########################'
rental1 = Rental.new('28-12-01', mr_wick, adarsh)
puts adarsh.rental, rental1
