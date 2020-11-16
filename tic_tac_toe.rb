=beginn

√ Set game   [GAME]
  Create board  [BOARD]
  Create two players  [PLAYER]
√ Enter game loop   [GAME]
  Display board  [BOARD]
  Ask move and validate it  [PLAYER]
  If game is over   [GAME]
    Display winner || Tied game message
    Stop looping
  Else
    Switch player and loop  [GAME]

    => 3 Classes: Game, Player, Board
=end

class Game # controls the flow of the game
  # initialize
    # - create board
    # - create players
    # assign initial player
  # end

  # play
    # loop
      # - display board
      # - get_move
      # - add_token
      # break if game_over?
      # switch_player
      # end
    # end
  # end

  # game_over?
    # winner
    # tie
  # end

  # winner
    # if current player has - winning_combination?
      # message
    # end

  # tie
    # if - board_full?
      # message
    # end

  # switch_player
    # 1 <> 2
  # end
end

class Player
  # initialize
    # name
    # token
  # end

  # get_move
    # loop
      # ask_move
      # if correct_format?
        # if - valid_move?
          # break
    # end
    # set coord
  # end

  # ask_move
    # message
    # gets.chomp
  # end

  # correct_format?
    # move = Integer (1..9)
  # end
end

class Board
  # initialize
    # board
  # end

  # display
    # puts board
  # end

  # add_token
    # if valid_move?
      # place token
    # else
      # message
    # end
  # end

  # valid_move?
    # !cell available?
      # display message
    # end
  # end

  # winning_combination?
  # end

  # full_board?
  # end
end