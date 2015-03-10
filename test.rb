require 'minitest/autorun'
require_relative 'image'
require_relative 'pixel'

class TestBlur < MiniTest::Test
  def test_show_image

    image = Image.new([
      [0,0,0,1,0,1,0],
      [0,0,1,0,1,0,1],
      [0,1,0,0,0,0,0],
      [1,0,0,0,0,0,1]
      ])

    image.show
  end

  # end
  # def test_pixels_to_blur
  #   image = Image.new([
  #     [0,0,0,1,0,1,0],
  #     [0,0,1,0,1,1,1],
  #     [0,1,0,0,0,0,0],
  #     [1,0,0,0,0,0,1]
  #     ])
  #   image.pixels_to_blur
  # end
    # def test_blur
    #   image = Image.new([
    #     [0,0,0,1,0,1,0],
    #     [0,0,1,0,1,1,1],
    #     [0,1,0,0,0,0,0],
    #     [1,0,0,0,0,0,1]
    #     ])
    #   image.blur
    # end
end
