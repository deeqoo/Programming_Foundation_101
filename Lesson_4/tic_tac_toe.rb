# Tic Tac Toe Game

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]].freeze       # diagonals

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
PLAYER = 'computer'

winning_score = {player: 0, computer: 0}
game_round = 1

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts "Win 5 games to win the match."
  puts "You are #{PLAYER_MARKER} & Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimeter=', ', word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.join(delimeter)
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select {|square, value| line.include?(square) && value == INITIAL_MARKER}.keys.first
  else
    nil
  end 
end

def offense_move(board, marker, square)
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, board, marker)
    break if square
  end
  square
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Chooose a square #{joinor(empty_squares(brd),', ')}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry that's not valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil

  square = offense_move(brd, COMPUTER_MARKER, square)

  if !square
    square = offense_move(brd, PLAYER_MARKER, square)
  end

  if !square && brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  elsif !square
    square = empty_squares(brd).sample
  end
  
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  for line in WINNING_LINES
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def increase_score(board, winning_score)
  if detect_winner(board) == 'Player'
    winning_score[:player] += 1
  elsif detect_winner(board) == 'Computer'
    winning_score[:computer] += 1
  end
end

def winner(winning_score)
  if winning_score[:player] == 5
    prompt("You won the match!")
  elsif winning_score[:computer] == 5
    prompt("Computer has won the match!")
  end
  winning_score
end

def places_piece!(brd, current_player)
  if current_player == 'computer'
    computer_places_piece!(brd)
  else
    player_places_piece!(brd)
  end
end

def alternate_player(current_player)
  if current_player == 'computer'
    'player'
  else
    'computer'
  end
end

def display_score(winning_score)
  prompt("score of this round, player: #{winning_score[:player]} & compuer: #{winning_score[:computer]}")
  winning_score
end

def reset_scores(winning_score)
  winning_score[:player] = 0
  winning_score[:computer] = 0
end

loop do # main loop 
  
  loop do
    board = initialize_board
    
    display_board(board)
    

    if PLAYER == 'choose'
      prompt("Do you want go first?(y or n)")
      reply = gets.chomp
      if reply == 'y'
        current_player = 'player'
      elsif reply == 'n'
        current_player = 'computer'
      else
        prompt("That's not valid choice.")
      end
    end

    if PLAYER != 'choose'
      current_player = PLAYER
    end
    
    loop do
      display_board(board)
      prompt("Round: #{game_round}") 
      places_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end  
    
    display_board(board)
    if someone_won?(board)
      prompt "#{detect_winner(board)} won the game!"
    else
      prompt "It's tie!"
    end
    
    game_round +=1
    increase_score(board, winning_score)
    display_score(winning_score)
    break if winning_score.values.include?(5)
    

    prompt ("Press 'c' for next game or any key to quit.")
    answer = gets.chomp
    break unless answer.downcase.start_with?("c") 
  end

  winner(winning_score) 
  prompt "Do you want to play another match? (y or n)"
  answer = gets.chomp
  reset_scores(winning_score)
  
  break unless answer.downcase.start_with?('y')
end # end of main loop

prompt "Thanks for playing Tic Tac Toe! Good bye!"
