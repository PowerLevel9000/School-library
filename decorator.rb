require './nameable'

class Decorator < Nameable
  attr_accessor :nameable
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
