require_relative 'image'

class Pixel
  attr_accessor :value
  attr_reader :x_position, :y_position

  def initialize( y_position, x_position, value )
    @y_position = y_position
    @x_position = x_position
    @value = value
  end  

end