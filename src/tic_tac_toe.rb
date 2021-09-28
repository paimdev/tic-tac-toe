# frozen_string_literal: true

# Module that chacks wheather the game was on or not in all possible combinations
module WinStates
  def horizontal_win?
    return true if @a1 == ' X ' && @b1 == ' X ' && @c1 == ' X '
    return true if @a1 == ' O ' && @b1 == ' O ' && @c1 == ' O '
    return true if @a2 == ' X ' && @b2 == ' X ' && @c2 == ' X '
    return true if @a2 == ' O ' && @b2 == ' O ' && @c2 == ' O '
    return true if @a3 == ' X ' && @b3 == ' X ' && @c3 == ' X '
    return true if @a3 == ' O ' && @b3 == ' O ' && @c3 == ' O '

    false
  end

  def vertical_win?
    return true if @a1 == ' X ' && @a2 == ' X ' && @a3 == ' X '
    return true if @a1 == ' O ' && @a2 == ' O ' && @a3 == ' O '
    return true if @b1 == ' X ' && @b2 == ' X ' && @b3 == ' X '
    return true if @b1 == ' O ' && @b2 == ' O ' && @b3 == ' O '
    return true if @c1 == ' X ' && @c2 == ' X ' && @c3 == ' X '
    return true if @c1 == ' O ' && @c2 == ' O ' && @c3 == ' O '

    false
  end

  def diagonal_win?
    return true if @a1 == ' X ' && @b2 == ' X ' && @c3 == ' X '
    return true if @a1 == ' O ' && @b2 == ' O ' && @c3 == ' O '

    false
  end
end

# Blueprint for the actual board and it's methods
class Board
  include WinStates

  def initialize
    @a1 = '   '
    @b1 = '   '
    @c1 = '   '
    @a2 = '   '
    @b2 = '   '
    @c2 = '   '
    @a3 = '   '
    @b3 = '   '
    @c3 = '   '
    @grid = [@a1, @b1, @c1, @a2, @b2, @c2, @a3, @b3, @c3]
  end

  def space_left?
    @grid.any? { |space| space == '   ' } ? true : false
  end

  def game_win?
    return true if horizontal_win? || vertical_win? || diagonal_win?

    false
  end
end

class Player
  def initialize(marker, name)
    @marker = marker
    @name = name
  end
end

game = Board.new

unless game.game_win? || (game.space_left? == false)
  puts 'The game is about to start'
  puts 'To play it type the area you want to put your marker'
end
