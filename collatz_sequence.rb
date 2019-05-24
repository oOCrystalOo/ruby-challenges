def collatz (num)
  array = [num]
  while array.last > 1
    if array.last % 2 == 0
      array << (array.last / 2)
    else
      array << (array.last * 3) + 1
    end
  end
  return array
end

def get_largest_chain(num)
  largest_count = 1
  largest_array = []
  
  arrays = Array.new(num)
  n = 1
  while n <= num
    if arrays[n - 1].nil?
      if n % 2 == 0
        if !arrays[(n / 2) - 1].nil?
          current_array = Marshal.load(Marshal.dump(arrays[(n / 2) - 1]))
          current_array.unshift(n)
          arrays[n - 1] = current_array
        else
          arrays[n - 1] = collatz(n)
        end
      else
        if n > 1 && n * 3 <= num
          #set an array ahead of time
          arrays[n * 3] = collatz((n * 3) + 1)
          current_array = Marshal.load(Marshal.dump(arrays[n * 3]))
          current_array.unshift(n)
          arrays[n - 1] = current_array
        else
          arrays[n - 1] = collatz(n)
        end
      end
    end
    if arrays[n - 1].length > largest_count
      largest_count = arrays[n - 1].length
      largest_array = arrays[n - 1]
    end
    
    n = n + 1
  end
  
  return largest_array
end

puts get_largest_chain(100000).inspect