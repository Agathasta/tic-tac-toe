# lib/tictactoe.rb
class Player
  @@count_players = 0
  attr_reader :name, :sign

  def initialize
    @@count_players += 1
    puts "Player #{@@count_players}, what's your name?"
    @name = gets.chomp
    @sign = @@count_players == 1 ? 'X' : 'O'
  end
end

class Board
end

class Game
end

player1 = Player.new
player2 = Player.new
