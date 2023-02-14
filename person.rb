class Person
  attr_accessor :color

  attr_reader :color

  attr_writer :color
  
#  def color=(col)
#   @color = col
#
#
#  def get_color
#    return @color
#  end
end

r = Person.new

r.color = "red"

p r.color

s = Person.new
s.color = "blue"

p s.color
