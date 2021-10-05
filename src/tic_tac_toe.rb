# frozen_string_literal: true

# Module that chacks wheather the game was won or not in all possible combinations
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
  attr_accessor :a1, :b1, :c1, :a2, :b2, :c2, :a3, :b3, :c3

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

  def print_board
    puts '   a   b   c'
    puts "1 #{@a1}|#{@b1}|#{@c1}"
    puts '  -----------'
    puts "2 #{@a2}|#{@b2}|#{@c2}"
    puts '  -----------'
    puts "3 #{@a3}|#{@b3}|#{@c3}"
  end

  def space_left?
    @grid.any? { |space| space == '   ' } ? true : false
  end

  def game_win?
    return true if horizontal_win? || vertical_win? || diagonal_win?

    false
  end
end

# Player properties and it's methods
class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def play
    puts 'Where do you want to place your marker?'
    gets.chomp
  end
end

class Game
  def initialize
    puts 'The game is about to start'
    puts 'To play it type the area you want to put your marker'

    @board = Board.new
    @player1 = Player.new(' X ')
    @player2 = Player.new(' O ')
  end

  def gameplay
    while true
      @board.print_board
      puts 'X to play:'
      mark_area(@player1)
      @board.print_board
      puts @board.game_win?
      puts 'O to play:'
      mark_area(@player2)
    end
  end

  def mark_area(player)
    puts 'Choose your area eg: a1, b2, c3...'
    area = gets.chomp
    @board.send("#{area}=", player.marker)
  end
end

test = Game.new
test.gameplay
