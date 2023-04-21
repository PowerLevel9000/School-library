require './decorator'
require './person'

class Capitalize < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
