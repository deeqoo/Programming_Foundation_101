# Question 1
# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq
puts numbers 
# => 1 2 2 3 
# numbers.uniq didn't modify the orginal object hence it stays the same. 

# Question 2, Describe the difference betwenn ! and ? in Ruby.

# Just to clarify, if you see ! or ? at the end of the method, 
# it's actually part of the method name, and not Ruby syntax. 
# Therefore, you really don't know what the method is doing, 
# even if it ends in those characters -- it depends on the method 
# implementation. The other uses are actual Ruby syntax:

# 1) != means not equal to and is used in conditional statment 
# 2) ! converts object to its opposite, like !true becomes false 
  # and !false becomes true.
# 3) ! after something like uniq! modifies the caller and changes 
  # the value of the original object
# 4) ? : is the ternary operator for if..else
# 5 ? before something return boolean true or false, .include? has_key?
  # return boolean value.
# 6) !!<someobject> is used to to turn any object into their boolean equivalent.

# Question 3, Replace the word "important" with "urgent" in the string.
advice = "Few things in life are as important as house training your pet dinosour."
advice.gsub!("important", "urgent")
puts advice

numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1) # Deleted at index 1
p numbers #=> [1,3,4,5]
numbers = [1, 2, 3, 4, 5]
numbers.delete(1) # Deletes first item in the array
p numbers #=> [2,3,4,5]

# Question 5
# Determine if 42 lies between 10 and 100
p (10..100).cover?(42)

# Question 6, show two different ways to put the expected "Four score and" in front of it.
famous_words = "seven years ago..."
famous_words = "Four score and " << famous_words
famous_words.prepend("Four score and ")

# Question 7, Fun with gsub
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)")}
p how_deep
p eval(how_deep) #=> 42

# Question 8, if we build an array like this:
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Peblles"]

# We will  end up with this "nested" array
#p flintstones
#=> ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Peblles"]]

# Make this un-nested array
flintstones.flatten!
#p flintstones
#=> ["Fred", "Wilma", "Barney", "Betty", "BamBam", "Peblles"]

# Question 9, given the hash below, turn into only two elements
# Barney's name and Barneys number.
flintstones = {"Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Peblles" => 5}
p flintstones.assoc("Barney")
#=> ["Barney", 2]

# Question 10, given the array below
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Peblles","BamBam"]
# Turn into a hash where names are the keys and the values are the positions in the array

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end

p flintstones_hash
#=> {"Fred"=>0, "Barney"=>1, "Wilma"=>2, "Betty"=>3, "Peblles"=>4, "BamBam"=>5}


