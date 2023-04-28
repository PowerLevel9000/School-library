require './nameable'

class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    puts '### parent corrected namable ###'
    @nameable
  end
end
