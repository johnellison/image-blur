require 'minitest/autorun'
require_relative 'image'
require_relative 'pixel'

class TestPixel < MiniTest::Test
  def test_pixel_initalize
    pixel = Pixel.new(0, 0, 1)

    expected = [0, 0, 1]
    actual = [pixel.y_position, pixel.x_position, pixel.value]

    assert_equal expected, actual
  end
end
