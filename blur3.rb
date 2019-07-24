class Image
  attr_accessor :image, :blur
  
  def initialize(image)
    @image = image
  end

  def output_image
    @image.each do |row| 
      puts row.join
    end
  end

  def blur(distance)
    if distance == 0
      return output_image
    end
    ray = []
    base = image[0].length
    stack = image.length
    
    image.length.times do |d|
      ray[d] = []
      image[d].length.times do |e|
        if image[d][e] == 1
          ray[d][e] = 1
        else
          ray[d][e] = 0
        end
      end
    end

    image.each.with_index do |row, row_num|
      row.each.with_index do |col, col_num|
        if col == 1
          if col_num + 1 < base 
            ray[row_num][col_num + 1] = 1
          end
          if (col_num - 1) >= 0 || (col_num - 1) < base
            ray[row_num][col_num - 1] = 1
          end
          if row_num + 1 < stack
            ray[row_num + 1][col_num] = 1
          end
          if (row_num - 1) >= 0 || (row_num - 1) < stack
            ray[row_num - 1][col_num] = 1
          end
        end
      end
    end
  @image = ray
  blur(distance - 1)
  end
end


image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0]
])

image.blur(3)
