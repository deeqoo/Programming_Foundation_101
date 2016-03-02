=begin
Mortgage calculator from Lesson 2, Small Programms
Launch School Assignment.

write mortgage calculator that calculates the following two thngs:
- Monthly interest rate
- Loan duration in months
=end

def prompt(message)
  Kernel.puts("=> #{message}")
end

prompt("Enter loan amount you wish to borrow pleaase:")
loan_amount = gets.chomp.to_i

prompt("Enter the annual interst rate(APR) in digits please")
annual_interest = gets.chomp.to_f/100

monthly_interest = (annual_interest / 12)

prompt("Enter loan duration, in years please:")
duration_years = gets.chomp.to_i

# calculating total number of paymnets over the loan period
# 12 months in year times by number of laon years
duration_months = (duration_years * 12)


# Mortgage formula to work out the sum
top = monthly_interest * ((1 + monthly_interest) ** duration_months) 
bottom = ((1 + monthly_interest) ** duration_months -1)
monthly_payments = (loan_amount * (top / bottom)).round(2)


puts "----------------------------------------------"
prompt("Your montly payment is: #{monthly_payments}")
puts "----------------------------------------------"
prompt("In #{duration_months} months you would repay the full loan")
puts "----------------------------------------------"




