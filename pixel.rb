require_relative 'image'

class Pixel
  attr_accessor :value
  attr_reader :x_position, :y_position

  def initialize( y_position, x_position, value )
    @y_position = y_position
    @x_position = x_position
    @value = value
  end  

  def self.find( y_position, x_position )
    # return a single pixel that matches y and x position arguments
  end

  def left
    # if (self.x_position = 0)
      # return null
    # else return Pixel.find( self.y_position, (self.x_position - 1) )
  end

  def right
    # if self.x_position = (image.width - 1)
      # return null
    # else return Pixel.find( self.y_position, (self.x_position + 1) )
  end

  def above
    # if self.y_position = 0
      # return null
    # else return Pixel.find( (self.y_position - 1), self.x_position )
  end

  def below
    # if self.y_position = (image.height - 1)
      # return null
    # else return Pixel.find( (self.y_position + 1), self.x_position )
  end

end