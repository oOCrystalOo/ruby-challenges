class Image
  def initialize (_array)
    if !_array.kind_of?(Array)
      puts "Not an array"
      return
    end
    @_array = _array
  end
  
  def output_image
    @_array.each do |x|
      string = ''
      x.each do |y|
        if y.kind_of?(Integer)
          string += y.to_s
        end
      end
      puts string
    end
  end
  
  def blur_image
    # Find each coloured in pixel and save it into array
    pixels = Marshal.load(Marshal.dump(@_array))
#    pixels = Array.new()
#    @_array.each do |x|
#      x.each do |y|
#        if y === 1
#          pixels << { row: @_array.find_index(x), column: x.find_index(y) }
#        end
#      end
#    end
    puts pixels
    # Loop through each coloured in pixel and then change surrounding pixels
    pixels.each do |x|
      row = x[:row]
      column = x[:column]
      if row > 0 
        @_array[row - 1][column] = 1
      end
      if row < @_array.length - 1 
        @_array[row + 1][column] = 1
      end
      if column > 0
        @_array[row][column - 1] = 1
      end
      if column < @_array[row].length - 1
        @_array[row][column + 1] = 1
      end
    end
  end
  
  # Deprecated old method
  def old_blur (distance)
    # Find each coloured in pixel and save it into array
#    pixels = Array.new()
#    @_array.each do |x|
#      x.each do |y|
#        if y === 1
#          pixels << { row: @_array.find_index(x), column: x.find_index(y) }
#        end
#      end
#    end
    pixels = Marshal.load(Marshal.dump(@_array))
    
    # Loop through the array and blur surrounding pixels
    pixels.each do |x| 
      row = x[:row]
      column = x[:column]
      # distance + 1 because starting point counts as 1. with Distance only, we will be short 1
      (distance + 1).times do |d|
        if !@_array[row - d].nil?
          # Always blur pixel on same column
          if !@_array[row - d][column].nil?
            @_array[row - d][column] = 1
          end
          # Loop through (distance - already looped though) times
          (distance - d).times do |e|
            if !@_array[row - d][column - (e + 1)].nil?
              @_array[row - d][column - (e + 1)] = 1
            end
            if !@_array[row - d][column + (e + 1)].nil?
              @_array[row - d][column + (e + 1)] = 1
            end
          end
        end
        if !@_array[row + d].nil?
          # Always blur pixel on same column
          if !@_array[row + d][column].nil?
            @_array[row + d][column] = 1
          end
          # Loop through (distance - already looped though) times
          (distance - d).times do |e|
            if !@_array[row + d][column - (e + 1)].nil?
              @_array[row + d][column - (e + 1)] = 1
            end
            if !@_array[row + d][column + (e + 1)].nil?
              @_array[row + d][column + (e + 1)] = 1
            end
          end
        end
      end
    end
  end
  
  def blur (distance)
    # Find each coloured in pixel and save it into array
    pixels = Array.new()
    @_array.each do |x|
      x.each do |y|
        if y === 1
          pixels << { row: @_array.find_index(x), column: x.find_index(y) }
        end
      end
    end
    
    # Loop through the array and blur surrounding pixels
    pixels.each do |x| 
      row = x[:row]
      column = x[:column]
      multiply = [1, -1]
      # distance + 1 because starting point counts as 1. with Distance only, we will be short 1
      (distance + 1).times do |d|
        multiply.each do |t|
          if (row + (d * t) >= 0) && !@_array[row + (d * t)].nil?
            # Always blur pixel on same column
            if !@_array[row + (d * t)][column].nil?
              @_array[row + (d * t)][column] = 1
            end
            # Loop through (distance - already looped though) times
            (distance - d).times do |e|
              multiply.each do |m|
                if (column + ((e + 1) * m) >= 0) && !@_array[row + (d * t)][column + ((e + 1) * m)].nil?
                  @_array[row + (d * t)][column + ((e + 1) * m)] = 1
                end
              end
            end
          end
        end
      end
    end
  end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1]
])
image.output_image
image.blur(3)
puts ''
image.output_image
