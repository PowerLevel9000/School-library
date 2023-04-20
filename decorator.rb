require './nameable.rb';

class Decorator < Nameable
    def initialize(nameable)
        super()
        @nameable = nameable
    end

    def correct_name
        #current initial corrected namable
        puts "### current Decorator corrected namable ###"
        @nameable
        # parent namable
        super()
        puts "### parent corrected namable ###"
        @namable
    end
end

puts "########################## decorator.rb file ######################"
decorator1 = Decorator.new("Adarsh")

# Again this could raise a error 
begin
    puts decorator1.correct_name
  rescue NotImplementedError => e
    puts e.message
end