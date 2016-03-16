# Rock Paper Scissors games, Lesson 2, 101 Prog Foundation

# List of valid options for the game
VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
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

loop do # Loop for choice validation.
  choice = ''
  loop do
    prompt("Choone one: #{VALID_CHOICES.join(' ')}")
    choice = Kernel.gets().chomp()

    break if VALID_CHOICES.include?(choice)
    prompt("That's not valid choice")
  end

  computer_choice = VALID_CHOICES.sample

  display_result(choice, computer_choice)
  Kernel.puts("You choose: #{choice}; Computer chose: #{computer_choice}")

  prompt("Do you want to play agian?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?("y")
end
prompt("Thank you for playing, Good bye!")
