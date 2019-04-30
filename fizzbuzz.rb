#!/usr/bin/env ruby

def fizzbuzz (value)
  if value % 3 == 0 && value % 5 == 0
    return 'fizzbuzz'
  end
  
  if value % 3 == 0
    return 'fizz'
  end
  if value % 5 == 0
    return 'buzz'
  end
  
  return value
end