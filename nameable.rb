class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

name1 = Nameable.new()
# this will raise a error so we will use error handling here

begin
  puts name1.correct_name
rescue NotImplementedError => e
  puts e.message
end
