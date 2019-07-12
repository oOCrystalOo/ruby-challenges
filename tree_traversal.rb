class MyQueue
  def initialize
    @queue = Array.new()
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end
  
  def empty?
    return @queue.empty?
  end
end

class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end
  
  # Depth search output
  def depth_search (payload)
    if self.payload == payload
      puts self.inspect
      return
    end
    if !self.children.nil?
      self.children.each do |child|
        child.depth_search (payload)
      end
    end
  end
  
  def breadth_search (payload)
    visited = Array.new()
    queue = MyQueue.new()
    queue.enqueue(self)
    
    while !queue.empty?
      current_node = queue.dequeue
      if current_node.payload == payload
        puts current_node.inspect
        return
      end
      
      visited.push(current_node)
      if !current_node.children.nil?
        !current_node.children.each do |child|
          if !visited.include?(child)
            queue.enqueue(child)
          end
        end
      end
    end
  end
end

# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])

# Depth search of 11
trunk.depth_search(11)

# Breadth search of 11
trunk.breadth_search(11)