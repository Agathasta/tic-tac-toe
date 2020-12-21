# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# controls the flow of the game
class TicTacToe
  def initialize
    @board = Board.new
    @player1 = Player.new('Player 1', 'X', @board)
    @player2 = Player.new('Player 2', 'O', @board)
    @current_player = @player1
    welcome
  end

  def play
    loop do
      @current_player.get_move
      @board.display
      break if game_over?

      switch_player
    end
  end

  private

  def welcome
    puts
    puts 'Welcome to exciting Tic Tac Toe'
    puts '(I am going to assume you know the rules)'
    puts 'This is the board:'
    @board.display
    puts 'Enjoy!'
  end

  def game_over?
    check_winner || check_tie
  end

  def check_winner
    if @board.winning_combination?(@current_player.token)
      puts "#{@current_player.name}, YOU WIN!!!!"
      true
    else
      false
    end
  end

  def check_tie
    if @board.full_board?
      puts 'Ohhhhhh... a tie'
      true
    else
      false
    end
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
end

game = TicTacToe.new
game.play
