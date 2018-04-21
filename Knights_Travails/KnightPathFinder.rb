class KnightPathFinder
  def initialize(pos)
    @pos = pos
    @visited_positions = [pos]
  end
  
  def self.valid_moves(pos)
    valid_positions = []
    
    valid_positions[0] = [pos[0] + 2, pos[1] + 1]
    valid_positions[1] = [pos[0] + 1, pos[1] + 2]
    valid_positions[2] = [pos[0] - 1, pos[1] + 2]
    valid_positions[3] = [pos[0] - 2, pos[1] + 1]
    valid_positions[4] = [pos[0] - 2, pos[1] - 1]
    valid_positions[5] = [pos[0] - 1, pos[1] - 2]
    valid_positions[6] = [pos[0] + 1, pos[1] - 2]
    valid_positions[7] = [pos[0] + 2, pos[1] - 1]
    
    valid_positions.select { |move| self.check_bounds?(move) }
  end
  
  def new_move_positions(pos)
    possible_moves = KnightPathFinder.valid_moves(pos) # then filter out visited positions
    possible_moves.reject{|move|@visited_positions.include?(move)}
  end
  
  
  
  def build_move_tree
    #root pos = @pos
    queue = [PolyTreeNode.new(pos)] #shift #push
    until queue.empty?
      current = queue.shift
    end
  end
  
  private
  def self.check_bounds?(pos)
    pos.all? { |coordinate| (0..7).cover?(coordinate) }
  end
  
end




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
end