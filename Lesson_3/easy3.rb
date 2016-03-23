# Exercises: Easy 3

# Question 1, show an easier way to write this array:

flinstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
# Easier way
flinstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Question 2, how to add family pet "Dino" to the array

flinstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Opton 1
#flinstones.push("Dino") 
# Option 2
flinstones << "Dino"
#p flinstones

# Question 3, how to add multiple items to the array?

# Option 1
#flinstones << "Dino" << "Hoppy"
# Option 2
flinstones.push("Dino, Hoppy")
# Option 3
#flinstones.concat(%w(Dino Hoppy)) # concat adds an array than one item
p flinstones

# Question 4, shorten this sentence
advice = "Few things in life are as important as house training your pet dinosaur"
shortened_sente = advice.slice!(0, advice.index("house"))
# Bonues
# if used String#slice, the orignal object(advice) doesn't change and remains 
# long sentence and not shortened.

p shortened_sente
p advice

# Question 5, write one-liner to count the number of lower-case 't'
# characters in the following string:

statement = "The flinstones Rock!"
# Two ways of doing it. 
puts statement.count('t')
puts statement.scan('t').count

# Question 6, 
title = "The Flinstones Family Members"
line_width = 40
puts(title.center(line_width))
# another way
puts title.center(40)