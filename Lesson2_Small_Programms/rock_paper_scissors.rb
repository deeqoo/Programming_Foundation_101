# Rock Paper Scissors games, Lesson 2, 101 Prog Foundation

VALID_CHOICES = %w(r p sc l sp).freeze()

def prompt(message)
  Kernel.puts("=> #{message}")
end

prompt("welcome to Rock Paper Scissors Lizar and Spock game")
prompt("Win 5 times against the computer to win the game.")
prompt("To exit the program at any time, enter 'exit' or 'end'")

WINNING_CHOICES = {
  'r' => %w(sc l),
  'p' => %w(r sp),
  'sc' => %w(p l),
  'sp' => %w(sc r),
  'l' => %w(sp p)
}.freeze()

def initials_hash
  {
    'r' => 'Rock',
    'p' => "Paper",
    'sc' => "Scissors",
    'sp' => "Spock",
    'l' => "Lizard"
  }
end

def initials_conversions(op)
  initials_hash[op]
end

def win?(first, second)
  WINNING_CHOICES[first].include?(second)
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You beat the computer, 1 point!")
  elsif win?(computer, player)
    prompt("Ops, You lost, 1 point for the computer!")
  else
    prompt("It's tie!")
  end
end

def points_score(player_score, computer_score)
  if player_score >= 5
    prompt("Congratulatiosn you won the game :-)")
    prompt("------------------------------------")
  elsif computer_score >= 5
    prompt("Sorry, you lost the game, :-( ")
    prompt("------------------------------------")
  end
end

def total_score(player, computer)
  prompt("You final score point(s) is/are: #{player}")
  prompt("Computer final score point(s) is/are: #{computer}")
end

def display_score(player, computer)
  prompt("You have: #{player} point(s)")
  prompt("Computer has: #{computer} point(s)")
end

display_terms = <<-MSG

  Key terms for the games.
  --------------------------------------
  Select r for Rock
  Select p for Paper
  Select sc for Scissors
  Select l for Lizard
  Select sp for Spock
  --------------------------------------
MSG

prompt(display_terms)

loop do # Main loop.
  player_score = 0
  computer_score = 0

  loop do
    choice = ''

    loop do
      prompt("Choone one: #{VALID_CHOICES.join(' ')}")
      choice = Kernel.gets().chomp()

      if %w(exit end).include?(choice)
        prompt('Games terminated early, good bye')
        exit
      end

      break if VALID_CHOICES.include?(choice)
      prompt("That's not valid choice")
    end

    computer_choice = VALID_CHOICES.sample

    Kernel.puts("You choose: #{initials_conversions(choice)}; Computer Chooose: #{initials_conversions(computer_choice)}")
    display_result(choice, computer_choice)

    if win?(choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, choice)
      computer_score += 1
    end

    display_score(player_score, computer_score)

    break if (player_score >= 5) || (computer_score >= 5)
  end

  points_score(player_score, computer_score)
  prompt("------ Final score of the game ------")
  prompt("------------------------------------")
  total_score(player_score, computer_score)
  prompt("------------------------------------")

  prompt("Do you want to play agian?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?("y")
end

prompt("Thank you for playing, Good bye!")
