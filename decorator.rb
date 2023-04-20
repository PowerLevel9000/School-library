require './nameable'

class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    puts '### current Decorator corrected namable ###'
    puts @nameable
    super()
    puts '### parent corrected namable ###'
    @nameable
  end
end

puts '########################## decorator.rb file ######################'
decorator1 = Decorator.new('Adarsh')

# this could raise a error so rescue
begin
  puts decorator1.correct_name
rescue NotImplementedError => e
  puts e.message
end
