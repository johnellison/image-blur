require_relative 'pixel'

class Image

  def initialize( array )
    @image = array
  end

  def show
    @image.each_with_index do |pixel_row, y_position|
      pixel_row.each_with_index do |pixel_value, x_position|
        pixel = Pixel.new(y_position, x_position, pixel_value)
        print pixel.value
      end
      puts
    end
  end

  # def pixels_to_blur
  #   pixels = []
  #   # loop over each row of pixels in the image
  #   @image.each_with_index do |row, row_index|
  #     # loop over each item in the row
  #     row.each_with_index do |item, item_index|
  #       if item == 1
  #         pixel_position = [row_index, item_index]
  #         pixels << pixel_position
  #       end
  #     end
  #   end
  # end  

  # def blur
    # blur-left
    # blur-right
    # blur-above
    # blur-below
  # end

  # def blur_left
  #   pixels_to_blur.each do | y|
  # end

end
