class PolyTreeNode
  attr_reader :value, :parent, :children
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  
  def parent=(par)
    return @parent = nil if par.nil? || @parent == par 
    @parent = par if @parent == nil
    par.children.push(self) 
  end

end