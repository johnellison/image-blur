require_relative 'pixel'

class Image
  attr_accessor :data

  def initialize( array )
    @data = array
  end

  def output_image
    # Loop over the row of pixels
    @data.each_with_index do |pixel_row, y_position|
      # Loop over each pixel
      pixel_row.each_with_index do |pixel_value, x_position|
        # for each item in the initialize array, create a pixel as such:
        # the integer in the array becomes the pixel's value
        print pixel_value
      end
      puts
    end
  end

  def blur
    on_pixels = []

    # Go through the image and create an array of pixels and array of pixels_to_blur
    @data.each_with_index do |pixel_row, y_position|
      pixel_row.each_with_index do |pixel_value, x_position|
        if pixel_value == 1
          on_pixels << [x_position, y_position]
        end      
      end
    end

    pixels_to_blur = []

    on_pixels.each do |position|
      x,y = position

      pixels_to_blur << [(x-1), y] if x != 0
      pixels_to_blur << [(x+1), y] if x != (self.width - 1)
      pixels_to_blur << [x, (y-1)] if y != 0
      pixels_to_blur << [x, (y+1)] if y != (self.height - 1)
    end

    pixels_to_blur.each do |position|
      x,y = position
      @data[y][x] = 1
    end

  end

  def width
    # return the number of pixels in a pixel-row (items in second dimenson of array)
    @data[0].length
  end

  def height
    # return the number of rows in the image (number of second dimesion arrays) 
    @data.length
  end

end
