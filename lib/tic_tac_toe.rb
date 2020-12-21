# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# controls the flow of the game
class TicTacToe
  def initialize
    @board = Board.new
    @player1 = Player.new('Player 1', "\e[36mX\e[0m", @board)
    @player2 = Player.new('Player 2', "\e[33mO\e[0m", @board)
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
    puts `clear`
    puts "\n\e[40m**** Tic Tac Toe Game ****\e[0m"
    puts "\n\e[37m(I am going to assume you know the rules)\e[0m"
    puts "\nThis is the board:"
    @board.display
    puts "Enjoy!\n\n"
  end

  def game_over?
    check_winner || check_tie
  end

  def check_winner
    if @board.winning_combination?(@current_player.token)
      puts "\e[34m#{@current_player.name}, YOU WIN!!!!\e[0m"
      true
    else
      false
    end
  end

  def check_tie
    if @board.full_board?
      puts "\e[34mOhhhhhh... a tie\e[0m"
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
