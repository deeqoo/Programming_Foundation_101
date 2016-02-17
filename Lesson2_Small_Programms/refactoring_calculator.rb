# Refactorying calculator application from 
# previous calculator application. 

# method to add prompt to messages on screen for readability
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i()  !=  0
end

def operation_to_message(op)
  case op 
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do 
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}")

#main loop of the applicaion
loop do 
  number1 = ''

  # looping for checking number and repeating until valid number entered
  loop do 
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp

    if valid_number?(number1)
      break
    else
      prompt("Hmm.... that doesn't look like a valid number")
    end
  end

  number2 = ''

  loop do 
    prompt("What's second number?")
    number2 = Kernel.gets().chomp

    if valid_number?(number2)
      break
    else
      prompt("Hmm.... that doesn't look like a valid number")
    end
  end

  operator_prompt = <<-MSG 
    What operation would you like perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)
  operator = ''
  
  loop do 
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  # using case statement instead of if/else to evaluate the operator selection
  result  = case operator 
            when '1'
              number1.to_i() + number2.to_i()
            when '2'
              number1.to_i() - number2.to_i()
            when '3'
              number1.to_i() * number2.to_i()
            when '4'
              number1.to_f() / number2.to_f()

  end

  prompt("#{operation_to_message(operator)} the two numbers")

  prompt("The result is: #{result}")

  prompt("Do you want to perform another calculation? (Y to caluclate again)")
  answer  = Kernel.gets().chomp
  # breaking the loop unless user enters 'y' to continue for more calculation.
  break unless answer.downcase().start_with?('y')

end

prompt("Thank you for using the calculator. Good bye!")