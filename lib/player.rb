# frozen_string_literal: true

# gets input from players
class Player
  attr_reader :name, :token

  def initialize(name, token, board)
    @name = name
    @token = token
    @board = board
  end

  def get_move
    loop do
      move = ask_move
      next unless correct_format?(move)
      break if @board.add_token(move, @token)
    end
  end

  private

  def ask_move
    puts "#{@name}, choose your move (a number 1 - 9):"
    print '> '
    gets.chomp.to_i - 1
  end

  def correct_format?(move)
    if (0..8).include?(move)
      true
    else
      puts "\e[31mWrong input!\e[0m"
      false
    end
  end
end
