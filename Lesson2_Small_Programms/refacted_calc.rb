# Refactorying calculator application from previous calculator app

# method to add prompt to messages on screen for readability
# Setting language for the the program
LANGUAGE = 'en'

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  #message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

def integer?(input)
  #num.to_i() != 0
  # Better integer validation, bonus feature.
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

# Method that tests to see whether the input is either number or float
def number?(input)
  integer?(input) || float?(input)
end

# method to dispaly the operation to be performed
def operation_to_message(op)
  # saving the return of the case to variable 
  word = case op
           when '1'
             MESSAGES['adding']
           when '2'
             MESSAGES['subtracting']
           when '3'
             MESSAGES['multiplying']
           when '4'
             MESSAGES['dividing']
         end

  x = "A random line of code"

  word
end

prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = Kernel.gets().chomp()

  break unless name.empty?()
  prompt(MESSAGES['valid_name'])
end

prompt("#{MESSAGES['greeting']} #{name}")

# main loop of the applicaion
loop do
  number1 = ''

  # looping for checking number and repeating until valid number entered
  loop do
    prompt(MESSAGES['first_num'])
    number1 = Kernel.gets().chomp

    if number?(number1)
      break
    else
      prompt(MESSAGES['error_message'])
    end
  end

  number2 = ''

  loop do
    prompt(MESSAGES['second_num'])
    number2 = Kernel.gets().chomp

    if number?(number2)
      break
    else
      prompt(MESSAGES['error_message'])
    end
  end

  operator_prompt = <<-MSG
    What operation would you like perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(MESSAGES['operator'])
  operator = ''

  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['operator_choice'])
    end
  end

  # using case statement instead of if/else to evaluate the operator selection
  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("#{operation_to_message(operator)} #{MESSAGES['operator_action']}")

  prompt("#{MESSAGES['result']} #{result}")

  prompt(MESSAGES['continue'])
  answer = Kernel.gets().chomp
  # breaking the loop unless user enters 'y' to continue for more calculation.
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['goodbye'])
