# Mortgage Calculator, 101 Prog Foundation.

def prompt(message)
  puts("=> #{message}")
end

loop do
  prompt("Welcome to Mortgage calculator")
  prompt("-------------------------------")

  name = ''
  loop do
    prompt("Enter your name!")
    name = gets.chomp
    break unless name.empty?
  end

  prompt("Hi #{name}, What's the loan amount?")
  loan_amount = ''

  # Checking if user entered correct amount and repeating until it's entered valid numbers.
  loop do
    loan_amount = gets.chomp
    break if !loan_amount.empty? && loan_amount.to_f > 0
    prompt("Must enter positive number.")
  end

  prompt("What is the annnual interst rate(APR)?")
  prompt("Example: 5 for 5% or 2.5 for 2.5%")

  interest_rate = ''

  loop do
    interest_rate = gets.chomp
    break if !interest_rate.empty? && interest_rate.to_f > 0
    prompt("Must enter positive number")
    # if interest_rate.empty? || interest_rate.to_f < 0
    #   prompt("Must enter positive number")
    # else
    #   break
    # end
  end

  prompt("What is the loan duration(in years)")

  loan_years = ''
  loop do
    loan_years = gets.chomp
    break if !loan_years.empty? && loan_years.to_i > 0
    prompt("Enter valid number")
    # if loan_years.empty? || loan_years.to_i < 0
    #   prompt("Enter valid number")
    # else
    #   break
    # end
  end

  annual_interest_rate = interest_rate.to_f / 100
  monthly_interest_rate = (annual_interest_rate / 12)
  loan_months = (loan_years.to_i * 12)

  # Mortgage calculator formula to working out the values
  monthly_payments = loan_amount.to_f *
                     (monthly_interest_rate * (1 + monthly_interest_rate)**loan_months) /
                     ((1 + monthly_interest_rate)**loan_months - 1)

  puts "----------------------------------------------"
  prompt("Your montly payment is: £#{monthly_payments.round(2)}")
  puts "----------------------------------------------"
  prompt("It will take you (#{name}) -#{loan_months}- months to repay the loan.")
  puts "----------------------------------------------"

  prompt("Do you want to perform another calculation?(Y to continue")
  answer = gets.chomp.downcase
  break unless answer.start_with?("y")
end

prompt("Thank you for using the Mortgage Calculator :-)")
prompt("Come back soon.")
