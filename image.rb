require 'byebug'

# Image for image blur problem
class Image
  attr_accessor :data

  def initialize(array)
    @data = array
  end

  def output_image
    @data.each do |pixel_row|
      pixel_row.each do |pixel_value|
        print pixel_value
      end

      print "\n"
    end
  end

  def blur!(distance = 1)
    distance.times do 
      blur_pixels!
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

  private

  def blur_pixels!
    on_pixels = []

    @data.each_with_index do |pixel_row, y|
      pixel_row.each_with_index do |pixel_value, x|
        on_pixels << [x, y] if pixel_value == 1
      end
    end

    on_pixels.each do |position|
      x, y = position

      # left
      @data[y][x - 1] = 1 if x - 1 >= 0
      # right
      @data[y][x + 1] = 1 if x + 1 <= (width - 1)
      # top
      @data[y - 1][x] = 1 if y - 1 >= 0
      # bottom
      @data[y + 1][x] = 1 if y + 1 <= (height - 1)
    end
  end
end
