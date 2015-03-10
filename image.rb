require_relative 'pixel'

class Image

  def initialize( array )
    @image = array
  end

  def show
    # Loop over the row of pixels
    @image.each_with_index do |pixel_row, y_position|
      # Loop over each pixel
      pixel_row.each_with_index do |pixel_value, x_position|
        # for each item in the initialize array, create a pixel as such:
        # the integer in the array becomes the pixel's value
        pixel = Pixel.new(y_position, x_position, pixel_value)
        print pixel.value
      end
      puts
    end
  end

  def which_pixels_to_blur
    # pixels_to_blur = []
    # pixels_to_blur << (where image.pixel.value == 1)
  end

  def blur
    # image.which_pixels_to_blur
    # => returns pixels_to_blur

    # relative_pixels = [left, right, above, below]

    # for each pixel in pixels_to_blur
      # for each relative_pixel in [relative_pixels]
        # if pixel.relative_pixel exists,
          # pixel.relative_pixel = 1
  end

  def width
    # return the number of pixels in a row
  end

  def height
    # return the number of rows in the image 
  end

end
