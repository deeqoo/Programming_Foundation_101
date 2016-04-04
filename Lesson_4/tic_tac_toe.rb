# Tic Tac Toe Game

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]].freeze       # diagonals

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

winning_score = {player: 0, computer: 0}
game_round = 1

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
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
  square = empty_squares(brd).sample
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

  # WINNING_LINES.each do |line|
  #   if brd.values_at(*line).count(PLAYER_MARKER) == 3
  #     return 'Player'
  #   elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
  #     return 'Computer'
  #   end
  # end
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

def display_score(winning_score)
  prompt("score of this round, player: #{winning_score[:player]} & compuer: #{winning_score[:computer]}")
  winning_score
end

def reset_scores(winning_score)
  winning_score[:player] = 0
  winning_score[:computer] = 0
end

loop do # main loop 
  display_score(winning_score)
  loop do # second loop
    
    board = initialize_board
    
    loop do # boad marking loop.
      display_board(board)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end # end of board making loop. 

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

    
  end # end of second loop.

  winner(winning_score) 
  prompt "Do you want to play another match? (y or n)"
  answer = gets.chomp
  reset_scores(winning_score)
  break unless answer.downcase.start_with?('y')
end # end of main loop

prompt "Thanks for playing Tic Tac Toe! Good bye!"
