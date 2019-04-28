class LinkedListNode
  attr_accessor :value, :next_node
  
  def initialize (value, next_node = nil)
    @value = value
    @next_node = next_node
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
  
  def reverse_list (list) 
    stack = Stack.new
    while list
      stack.push(list.value)
      list = list.next_node
    end
    
    print_values(stack.data)
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

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

node3.print_values(node3)

node3.reverse_list(node3)