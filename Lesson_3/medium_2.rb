# Exercise: Medium 2

# Question 1
ages = {"Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10}
# Hashes are commonly found more complex than this.

# Its often that each key points to another hash instead of just
# a single value. 

munsters ={
  "Herman" => {"age" => 32, "gender" => "male"},
  "Lilly" => {"age" => 30, "gender" => "female"},
  "Grandpa" => {"age" => 402, "gender" => "male"},
  "John" => {"age" => 42, "gender" => "male"}
}

# Figure out the total age of just the males members of the family. 
total_male_age = 0
munsters.each do |name, details|
  total_male_age += details["age"] if details["gender"] == "male"
end

puts "Total male ages in Munster family is: #{total_male_age}"
puts "-------------------------------"

# Question 2, Print out the name, age and gender of each 
# family member in munsters hash:

munsters ={
  "Herman" => {"age" => 32, "gender" => "male"},
  "Lilly" => {"age" => 30, "gender" => "female"},
  "Grandpa" => {"age" => 402, "gender" => "male"},
  "Marilyn" => {"age" => 23, "gender" => "female"}
}

# Solution: 
munsters.each do |name, details|
  puts "#{name} is a #{details["age"]} years old #{details["gender"]}"
end
puts "-------------------------------"

# Question 3, refactor this code so the result is easier 
# to predict and maintain.
puts "Tricky method"

def tricky_method(a_string_param, an_array_param)
  a_string_param << "rutabaga"
  an_array_param << "rutabaga"

  return a_string_param, an_array_param
end

my_string = "pumpkins "
my_array = ["pumpkins"]

#my_string, my_array = 
tricky_method(my_string, my_array)
puts "-------------------------------"

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
puts "-------------------------------"

puts "not so tricky method"
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)
puts "-------------------------------"
puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
puts "-------------------------------"

# Question 4, break up this string and put it back together
# with the words in reverse order.

sentence = "Humpty Dumpty sat on a wall"
reversed_sentence = sentence.split.reverse.join(" ")+"."
puts reversed_sentence
puts "-------------------------------"

# Another way.
words = sentence.split(/\W/)
words.reverse!
backward_sentence = words.join(" ") + "."
puts backward_sentence
puts "-------------------------------"

# Question 5, what's the output of the following code?
answer = 42
def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)
p answer -8 #=> 34
puts "-----------------------------------"
# because its subtracting from the answer variable(42) 
# 42-8 = 34.

# Question 6, messing with hash data.
munsters = {
  "Herman" => {"age" => 32, "gender" => "male"},
  "Lilly" => {"age" => 30, "gender" => "female"},
  "Grandpa" => {"age" => 402, "gender" => "male"},
  "Eddie" => {"age" => 10, "gender" => "male"},
  "Marilyn" => {"age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_memember|
    family_memember["age"] += 42
    family_memember["gender"] = "other"
  end
end

puts mess_with_demographics(munsters)
puts "-------------------------------"
puts munsters
puts "--------------------------------"

# Solution
# Family data got ransacked and it modified the original family
# hash data, here's the output, age and gender been changed.

#=> {"Herman"=>{"age"=>74, "gender"=>"other"}, "Lilly"=>{"age"=>72, 
# "gender"=>"other"}, "Grandpa"=>{"age"=>444, "gender"=>"other"}, 
# "Eddie"=>{"age"=>52, "gender"=>"other"}, 
# "Marilyn"=>{"age"=>65, "gender"=>"other"}}

# Question 7

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps("paper", "scissors") #=> scissors
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
#=> paper
puts "-----------------------------------"

# Question 8, consider these two methods:
def foo(parm = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

p bar(foo) 
#=> no
# because foo method returns 'yes' and if there's yes in bar method it return no, 
# if its no then it returns yes. 
     
