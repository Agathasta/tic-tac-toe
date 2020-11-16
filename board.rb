# frozen_string_literal: true

# displays and saves the board, checks game status
class Board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display
    puts "
          |-----|-----|-----|
          |  #{@board[0]}  |  #{@board[1]}  |  #{@board[2]}  |
          |-----|-----|-----|
          |  #{@board[3]}  |  #{@board[4]}  |  #{@board[5]}  |
          |-----|-----|-----|
          |  #{@board[6]}  |  #{@board[7]}  |  #{@board[8]}  |
          |-----|-----|-----|
          "
  end

  def add_token(move, token)
    if valid_move?(move)
      @board[move] = token
    else
      puts 'That move is already taken'
    end
  end

  def valid_move?(move)
    @board[move].instance_of?(Integer)
  end

  def full_board?
    @board.all? { |c| c.instance_of?(String) }
  end

  def winning_combos
    [[@board[0], @board[1], @board[2]],
     [@board[3], @board[4], @board[5]],
     [@board[6], @board[7], @board[8]],
     [@board[0], @board[3], @board[6]],
     [@board[1], @board[4], @board[7]],
     [@board[2], @board[5], @board[8]],
     [@board[0], @board[4], @board[8]],
     [@board[2], @board[4], @board[6]]]
  end

  def winning_combination?(token)
    winning_combos.any? { |triplet| triplet.all? { |c| c == token } }
  end
end
