# Rock Paper Scissors games, Lesson 2, 101 Prog Foundation

# List of valid options for the game
VALID_CHOICES = %w(r p sc l sp).freeze()

def prompt(message)
  Kernel.puts("=> #{message}")
end

prompt("welcome to Rock Paper Scissors Lizar and Spock game")

def win?(first, second)
  (first == 'r' && %w(sc l).include?(second)) ||
    (first == 'p' && %w(r sp).include?(second)) ||
    (first == 'sc' && %w(p l).include?(second)) ||
    (first == 'l' && %w(sp p).include?(second)) ||
    (first == 'sp' && %w(sc r).include?(second))
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You win!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's tie!")
  end
end

player_score = 0
computer_score = 0

def display_score(player, computer)
  prompt("Your score is: #{player_score}")
  prompt("Computer score is: #{computer_score}")
end

# def winner(player, computer)
#   if player >= 5
#     prompt("You won #{player_score} times")
#   elsif computer >= 5
#     prompt("Sorry you lost, computer won #{computer_score} times")
#   end
# end

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

loop do # Loop for choice validation.
  choice = ''
  loop do
    prompt("Choone one: #{VALID_CHOICES.join(' ')}")
    choice = Kernel.gets().chomp()

    break if VALID_CHOICES.include?(choice)
    prompt("That's not valid choice")
  end

  computer_choice = VALID_CHOICES.sample

  Kernel.puts("You choose: #{choice}; Computer Chooose: #{computer_choice}")
  
  display_result(choice, computer_choice)
  
  if win?(choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, choice)
    computer_score += 1
  end

  display_score(player_score, computer_score)
  
  prompt("Do you want to play agian?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?("y")
end
prompt("Thank you for playing, Good bye!")
