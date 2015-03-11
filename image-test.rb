require 'minitest/autorun'
# How do I get factory_girl to work on non-rails project?
require_relative 'factories'
require_relative 'image'
require_relative 'pixel'

class TestBlur < MiniTest::Test

  # def test_image_initialize
  # end

  def image_data
    Image.new([
      [0,0,0,0,0,0,0],
      [0,0,1,0,0,0,0],
      [0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0]
      ])
  end

  def test_image_blur
    image = image_data  

    expected = [
      [0,0,1,0,0,0,0],
      [0,1,1,1,0,0,0],
      [0,0,1,0,0,0,0],
      [0,0,0,0,0,0,0]
      ]

    image.blur

    assert_equal expected, image.data
  end

  def test_edge_case_top_left_corner
    image = Image.new([
      [1,0,0,0,0,0,0],
      [0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0]
      ])

    expected = [
      [1,1,0,0,0,0,0],
      [1,0,0,0,0,0,0],
      [0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0]
      ]

    image.blur

    assert_equal expected, image.data
  end

  def test_edge_case_bottom_right_corner
    image = Image.new([
      [0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0],
      [0,0,0,0,0,0,1]
      ])

    expected = [
      [0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0],
      [0,0,0,0,0,0,1],
      [0,0,0,0,0,1,1]
      ]

    image.blur

    assert_equal expected, image.data
  end

#   def test_image_output

#     image = image_data

#     # expected = ?
#     # actual = image.show
#     # assert_equal expected, actual
#   end

#   def test_image_width
#     image = image_data

#     assert_equal 7, image.width
#   end

#   def test_image_height
#     image = Image.new([
#       [0,0,0,1,0,1,0],
#       [0,0,1,0,1,0,1],
#       [0,1,0,0,0,0,0],
#       [1,0,0,0,0,0,1]
#       ])

#     assert_equal 4, image.height
#   end

#   def test_image_which_pixels_to_blur
#     image = Image.new([
#       [0,0,0,1,0,1,0],
#       [0,0,1,0,1,1,1],
#       [0,1,0,0,0,0,0],
#       [1,0,0,0,0,0,1]
#       ]

#     # expected = ?
#     # actual = image.pixels_to_blur
#     # assert_equal expected, actual
#     image.which_pixels_to_blur
#   end

#   # def test_image_blur
#   #   image = Image.new([
#   #     [0,0,0,1,0,1,0],
#   #     [0,0,1,0,1,1,1],
#   #     [0,1,0,0,0,0,0],
#   #     [1,0,0,0,0,0,1]
#   #     ])
#   # 
#   #   exptected = ? 
#   #   actual = image.blur
#   #   assert_equal expected, actual
#   # end
end
