class Game # controls the flow of the game
  def initialize
    @board = Board.new
    @player_1 = Player.new("Player 1", "X", @board)
    @player_2 = Player.new("Player 2", "O", @board)
    @current_player = @player_1
    welcome
  end

  def welcome
    puts
    puts "Welcome to exciting Tic Tac Toe"
    puts "(I am going to assume you know the rules)"
    puts "This is the board:"
    @board.display
    puts "Enjoy!"
  end

  def play
    loop do
      @current_player.get_move
      @board.display
      break if game_over?
      switch_player
    end
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
      puts "Ohhhhhh... a tie"
      true
    else
      false
    end
  end

  def switch_player
    @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
  end
end

class Player
  attr_accessor :name, :token

  def initialize(name, token, board)
    @name = name
    @token = token
    @board = board
  end

  def get_move
    loop do
      move = ask_move
      if correct_format?(move)
        if @board.add_token(move, @token)
          break
        end
      end
    end
  end

  def ask_move
    puts "#{@name}, choose your move (a number 1 - 9):"
    print "> "
    (gets.chomp.to_i) - 1
  end

  def correct_format?(move)
    if (0..8).include?(move)
      true
    else
      puts "Wrong input!"
      false
    end
  end
end

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
      puts "That move is already taken"
    end
  end

  def valid_move?(move)
    @board[move].class == Integer
  end

  def full_board?
    @board.all? { |c| c.class == String}
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

game = Game.new
game.play