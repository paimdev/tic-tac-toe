
class Board
  def initialize
   @a1 = "   "
   @b1 = "   "
   @c1 = "   "
   @a2 = "   "
   @b2 = "   "
   @c2 = "   "
   @a3 = "   "
   @b3 = "   "
   @c3 = "   "
    
  @grid = [@a1, @b1, @c1, @a2, @b2, @c2, @a3, @b3, @c3]
  end

  private
  def space_left?
    @grid.any? { |space| space == "   "} ? true : false
  end
end

b1 = Board.new