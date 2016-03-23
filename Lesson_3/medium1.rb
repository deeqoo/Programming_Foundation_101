# Exercises: Medium 1
# Question 1, lets do 'ASCII Art'
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

# Question 2
# Create hash that expresses the frequency with 
# which each letter occurs in this string

statement = "The Flintstones Rock"
statement_hash = {} 
letters = ("A".."Z").to_a + ("a".."z").to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  statement_hash[letter] = letter_frequency if letter_frequency > 0
end

puts statement_hash

# Question 3, the following statement will be an error:
# puts "the value of 40 + 2 is " + (40 + 2)

# why is this and what are the two possible ways to fix this?
# Issue:
# String and number can't be concatinated without converstion.  
# Option 1
add_nums = 40 + 2
puts "the value of 40 + 2 is #{add_nums}"
# Option 2
puts "the value of 40 + 2 is: #{40+2}"
# Option 3
puts "the value of 40 + 2 is: " + (40+2).to_s

# Question 4, what happens we modify an array
# while we are iteration over it?
# what will be the output of this code:

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
#=> 1 3
# modifying an array while iterating over it creates un-expected 
# behaviours which are not good. 

# What would be the output of this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
#=> 1 2

# better explanation of what's happening:
numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.shift(1)
end

# Question 5, all factors of the input number
def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

puts factors(5)
# Bonus Answer 1
# Determines if the result of the division is an integer 
# it will only add number to the divisors array if there's 
# remainder(%)

# Bonus Answer 2
# It's the return value of the method

# Question 6, 
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

# The first implementation modifies the caller and will end changed after
# the rolling_buffer1 returns
# However second implementation doesn't alter the caller after rolling_buffer2 returns

# Question 7, what's wrong with this code?

#limit = 15 # variable scope, methods have their scope 
def fib(first_num, second_num)
  limit = 15 # creating var here solves the problem
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0,1)
puts "result is #{result}"

# Question 8

def titleize(words)
  words.split.map {|word| word.capitalize}.join(" ")
end

p titleize("hello london its amazing day")

# Question 9, modify the hash so that Munster family
# has an additional "age_group" key that has
# three values describing the age group.

munsters = {
  "Herman" => {"age" => 32, "gender" => "male"},
  "Lily" => {"age" => 30, "gender" => "female"},
  "Grandpa" => {"age" => 402, "gender" => "male"},
  "Eddie" => {"age" => 10, "gender" => "male"},
  "Marilyn" => {"age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
      
munsters.each do |key, value|
  puts "#{key}: #{value}"
end