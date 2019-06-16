def collatz (num)
  array = [num]
  while array.last > 1
    if array.last % 2 == 0
      array << (array.last / 2)
    else
      array << (array.last * 3) + 1
    end
  end
  
  mini_hash = Hash.new
  array.reverse.each_with_index do |x, index| 
    if !mini_hash[x]
      mini_hash[x] = array[index..array.length - 1]
    end
  end
  
  return mini_hash
end

def get_largest_chain_length (end_num) 
  count = 0
  number_with_largest_chain = 1
  collatz_hash = Hash.new
  
  i = end_num
  while i > 0
    if !collatz_hash[i]
      mini_hash = collatz(i)
      mini_hash.each do |key, value|
        if !collatz_hash[key]
          collatz_hash[key] = value
          if value.length > count
            count = value.length
            number_with_largest_chain = key
          end
        end
      end
    end
    i = i - 1
  end
  
  puts "Number with the largest chain is #{number_with_largest_chain} with #{count} items."
  puts collatz_hash[number_with_largest_chain].inspect
end

get_largest_chain_length(1000000)