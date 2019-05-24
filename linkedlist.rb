class LinkedListNode
  attr_accessor :value, :next_node
  
  def initialize (value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :data
  
  def initialize 
    @data = nil
  end
  
  def push (value)
    @data = LinkedListNode.new(value, @data)
  end
  
  def pop
    if @data.nil? 
      return nil
    end
    value = @data.value
    @data = @data.next_node
    return value
  end
end

def print_values (list_node)
    if list_node 
      print "#{list_node.value} --> "
      print_values(list_node.next_node)
    else
      print "nil\n"
      return
    end
  end
  
#reverse linkedlist with stack
def old_reverse_list (list) 
  stack = Stack.new
  while list
    stack.push(list.value)
    list = list.next_node
  end

  print_values(stack.data)
end


# Reverse linkedlist with mutation
def reverse_list (list, previous = nil)
  if list
    next_node = list.next_node
   # puts "Next node is: " + next_node.inspect
    list.next_node = previous
   # puts "Previous node is: " + previous.inspect
    reverse_list(next_node, list)
  end
  # puts list.inspect
end

# Check if linkedlist is infinite
def is_infinite(list)
  node = list
  while (list.next_node)
    list = list.next_node
    if list == node
      return true
    end
  end
  return false
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)
#old_reverse_list(node3)

node1.next_node = node3
puts is_infinite(node3)

node1.next_node = nil
puts is_infinite(node3)

reverse_list(node3)
print_values(node1)