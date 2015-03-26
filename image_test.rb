require 'minitest/autorun'
require_relative 'image'

class TestBlur < MiniTest::Test

  def build_image
    Image.new([
      [0,0,0,0,0,0,0],
      [0,0,1,0,0,0,0],
      [0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0]
      ])
  end

  def build_big_image
    Image.new([
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,1,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0]
      ])
  end

  # 1px
  def test_image_blur_1px
    image = build_image  

    expected = [
      [0,0,1,0,0,0,0],
      [0,1,1,1,0,0,0],
      [0,0,1,0,0,0,0],
      [0,0,0,0,0,0,0]
      ]

    image.blur!(1)

    assert_equal expected, image.data
  end

  def test_edge_case_top_left_corner_1px
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

    image.blur!(1)

    assert_equal expected, image.data
  end

  def test_edge_case_bottom_right_corner_1px
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

    image.blur!(1)

    assert_equal expected, image.data
  end

end
