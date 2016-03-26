# Exercises: Hard 1
require 'securerandom'
# Question 1, what do you expect to happen when this greeting
# variable is referenced in the last line of code below?

if false
  greeting "hellow wold"
end

#greeting

#=> undefined local variable or method `greeting' for main:Object (NameError)
# reurns error because greeting is not declared and flase is false, no excution. 

# Question 2, 
greetings = {a: 'hi'}
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting #> hi there
puts greetings #=> {:a=> "hi there"}
puts "---------------------------\n\n"

# Question 3, variable scope
# variable scope and modification of one scope by 
# another, condider the following similar set of code.

# What will the be printed by each of these code groups?
# A)
puts "A, Mess with vars"
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end
one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)
puts "one is: #{one}" #=> one is: one
puts "two is: #{two}" #=> two is: two
puts "three is: #{three}" #=> three is: three
puts "-----------------------------------------"
puts "\n"

# B
puts "B, Mess with vars two"
def mess_with_vars_two(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end
one = "one"
two = "two"
three = "three"

mess_with_vars_two(one, two, three)

puts "one is: #{one}" #=> one is: one
puts "two is: #{two}" #=> two is: two
puts "three is: #{three}" #=> three is: three
puts "---------------------------\n\n"

# C)
puts "C, Mess with variable three"
puts "------------------------------"
def mess_with_vars_three(one, two, three)
  one.gsub!("one", "two")
  two.gsub!("two", "three")
  three.gsub!("three", "one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars_three(one, two, three)
puts "one is: #{one}" #=> one is: two
puts "two is: #{two}" #=> two is: three
puts "three is: #{three}" #=> three is: one
puts "--------------------------------------\n\n"


# Question 4, write method that returns one UUID when called with no parameters.
puts "Universal ID, UUID"
def universal_id
  p SecureRandom.uuid
end
universal_id

def generate_UUID
  characters = [] 
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

p generate_UUID

# Question 5, 
def is_a_number?(number)
  number.to_i.to_s == number
end

#p is_a_number?(3)

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)
  end

  true
end

p dot_separated_ip_address?("100.200.400.500")