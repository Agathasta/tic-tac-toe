# Controls the game
class TicTacToe
  def initialize
    @board = Board.new
    @player1 = Player.new("Player X", :x, @board)
    @player2 = Player.new("Player O", :o, @board)
    @current_player = @player1
  end

  # play
  def play
    loop do
      @board.display
      @current_player.get_choice
      break if check_game_over
      switch_players
    end
  end

  def check_game_over
    if check_victory || check_draw
      true
    end
  end
  def check_victory
    if @board.winning_combination?
      puts "#{@current_player}, you won"
    end
  end
  def check_draw
    if @board.full?
      puts "It's a draw"
    end
  end

  def switch_players
    if @current_player = @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end
end

# Controls the players
class Player
  def initialize(name, token, board)
    @name = name
    @token = token
    @board = board
  end

  def get_choice
    loop do
      choice = ask_choice
      if valid_input(choice)
        # if @board.add_token(choice, @token)
          break
        # end
      end
    end
  end

  def ask_choice
    puts "#{@name}, choose a number"
    gets.chomp.to_i
  end

  def valid_input(choice)
    if choice.is_a? Integer
      true
    else
      puts "Must be an integer!!"
    end
  end
end

# Controls the board
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

  def add_token(choice, token)
    if valid_token_location?
      @board = @board.map do |cell|
        cell = cell == choice ? token : cell
      end
      true
    else
      false
    end
  end

  def valid_token_location?(choice)
    if valid_choice?
      choice_available?
    end
  end

  def valid_choice?(choice)
    if choice = (1..9)
      true
    else
      puts "Number 1 - 9!"
    end
  end

  def choice_available?(choice)
    if @board[choice].is_a? Integer
      true
    else
      puts "That field was already chosen!"
    end
  end

  def winning_combination?
    if @board[0] == @board[1] && @board[1] == @board[2] ||
      @board[3] == @board[4] && @board[4] == @board[5] ||
      @board[6] == @board[7] && @board[7] == @board[8] ||
      @board[0] == @board[3] && @board[3] == @board[6] ||
      @board[1] == @board[4] && @board[4] == @board[7] ||
      @board[2] == @board[5] && @board[5] == @board[8] ||
      @board[0] == @board[4] && @board[4] == @board[8] ||
      @board[2] == @board[4] && @board[4] == @board[6]
      true
    end
  end
  
  # def winning_combination?
  #   WINNING_COMBINATIONS.each do |line|
  #     line.all? {|cell| cell == "x" || cell == "o"}
  #   end
  # end

  def full?
    @board.none? {|cell| cell.is_a? Integer}
  end
end

t = TicTacToe.new
t.play
