require 'benchmark'
num = 35

def recursive_fib (num) 
  return num if num <= 1 
  recursive_fib( num - 1 ) + recursive_fib( num - 2 )
end

def iterative_fib (num)
  fib_array = [0, 1]
  (num + 1).times do |x|
    if fib_array[x].nil?
      fib_array << fib_array[x - 2] + fib_array[x - 1]
    end
  end
  
  return fib_array[num]
end

Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(num) }
  x.report("iterative_fib") { iterative_fib(num) }
end