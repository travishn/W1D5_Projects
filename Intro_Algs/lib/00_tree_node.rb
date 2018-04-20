class PolyTreeNode
  attr_reader :value, :parent, :children
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  
  def parent=(par)
    return @parent = par if par.nil? || parent == par 
    
    parent.children.delete(self) unless parent.nil?
    @parent = par
    par.children.push(self) 
  end
  
  
  def add_child(child)
      child.parent = self 
  end
    
  def remove_child(child)
    raise "Node is not a child." unless children.include?(child)
    child.parent = nil
  end
  
  
  def dfs(target_value)
    return self if target_value == value
    return nil if children.empty?
  
    children.each do |node|
      target_node = node.dfs(target_value)
      return target_node if target_node.class == PolyTreeNode
    end
  
    nil
  end
  
  def bfs(target_value)
    queue = [self] #shift/push
    until queue.empty?
      current = queue.shift
      return current if current.value == target_value
      current.children.each{|child| queue.push(child)}
    end 
    nil
  end
  
end
