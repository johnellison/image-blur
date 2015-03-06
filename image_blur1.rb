class Image < Array
  def initialize( array )
    @image = []
    @image << array[0][0..3] << array[1][0..3] << array[2][0..3] << array[3][0..3]
  end

  def output_image
    @image.each do |x|
      x.each do |cell|
        print cell
      end
      puts
    end
  end

end

image = Image.new([
  [0,0,0,1],
  [0,0,1,0],
  [0,1,0,0],
  [1,0,0,0]
  ])

image.output_image
