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

  # 2px
  def test_image_blur_2px
    image = build_big_image 

    expected = [
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,1,0,0,0,0,0],
      [0,0,0,1,1,1,0,0,0,0],
      [0,0,1,1,1,1,1,0,0,0],
      [0,0,0,1,1,1,0,0,0,0],
      [0,0,0,0,1,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0]
      ]  

    image.blur!(2)

    assert_equal expected, image.data
  end

  def test_image_blur_2px_top_left
    image = Image.new([
      [1,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0]
      ])  

    expected = [
      [1,1,1,0,0,0,0,0,0,0],
      [1,1,0,0,0,0,0,0,0,0],
      [1,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0]
      ]  

    image.blur!(2)

    assert_equal expected, image.data
  end

  def test_image_blur_2px_edge_2
    image = Image.new([
      [0,0,0,0,0,0,0,0,0,0],
      [0,1,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0]
      ])  

    expected = [
      [1,1,1,0,0,0,0,0,0,0],
      [1,1,1,1,0,0,0,0,0,0],
      [1,1,1,0,0,0,0,0,0,0],
      [0,1,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0]
      ]  

    image.blur!(2)

    assert_equal expected, image.data
  end

  def test_image_blur_2px_bottom_right
    image = Image.new([
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,1]
      ])  

    expected = [
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,1],
      [0,0,0,0,0,0,0,0,1,1],
      [0,0,0,0,0,0,0,1,1,1]
      ]  

    image.blur!(2)

    assert_equal expected, image.data
  end

  def test_image_blur_3px
    image = build_big_image  

    expected = [
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,1,0,0,0,0,0],
      [0,0,0,1,1,1,0,0,0,0],
      [0,0,1,1,1,1,1,0,0,0],
      [0,1,1,1,1,1,1,1,0,0],
      [0,0,1,1,1,1,1,0,0,0],
      [0,0,0,1,1,1,0,0,0,0],
      [0,0,0,0,1,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0]
      ]

    image.blur!(3)

    assert_equal expected, image.data
  end

  def test_image_blur_4px
    image = build_big_image  

    expected = [
      [0,0,0,0,1,0,0,0,0,0],
      [0,0,0,1,1,1,0,0,0,0],
      [0,0,1,1,1,1,1,0,0,0],
      [0,1,1,1,1,1,1,1,0,0],
      [1,1,1,1,1,1,1,1,1,0],
      [0,1,1,1,1,1,1,1,0,0],
      [0,0,1,1,1,1,1,0,0,0],
      [0,0,0,1,1,1,0,0,0,0],
      [0,0,0,0,1,0,0,0,0,0],
      [0,0,0,0,0,0,0,0,0,0]
      ]

    image.blur!(4)

    assert_equal expected, image.data
  end

end
