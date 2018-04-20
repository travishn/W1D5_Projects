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
    child.parent = nil
  end

end