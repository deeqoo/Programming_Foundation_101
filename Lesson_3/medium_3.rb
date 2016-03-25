# Exercises: Medium 3

# Question 1, Predict how the values and object ids will change 
# throughout the flow of the code below:

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with id of: #{a_outer_id} before the block"
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block"
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block"
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block.\n\n"
  puts "--------------------------------------------------------------------"

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer.object_id} inside the block"
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer.object_id} inside the block"
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer.object_id} inside the block"
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer.object_id} inside the block"
    puts "--------------------------------------------------------------------"

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    puts "a_outer inside after reasignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    puts "b_outer inside after reasignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    puts "c_outer inside after reasignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    puts "d_outer inside after reasignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
    puts "--------------------------------------------------------------------"
    
    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = d_outer

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer).\n\n"
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block.\n\n"
  puts "----------------------------------------------------------------------------------------------------------"
 
  # Can't be accessed from here as it was declared inside block and is only visible inside block.
  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block.\n\n" rescue puts "ugh ohhhhh"
  puts "--------------------------------------------------------------------------------------------------------------------------------"
 
end
#fun_with_ids

# Quesiton 2, Looking from method call perspective.
# Predict how the values and objects will change throughout the flow of the code below:

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the method."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the method."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the method."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the method.\n\n"

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

  # Methods don't change tha values declared outside as it has its own scope, hence original valus 
  # stay the same.
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call.\n\n"

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method.\n\n" rescue puts "ugh ohhhhh"
end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)
  a_outer_inner_id = a_outer.object_id
  b_outer_inner_id = b_outer.object_id
  c_outer_inner_id = c_outer.object_id
  d_outer_inner_id = d_outer.object_id

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method.\n\n"

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.\n\n"


  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer).\n\n"
end
#fun_with_ids

# Question 3, study the following code and state what will be displayed... and why:

def tricky_method(a_string_parm, an_array_param)
  a_string_parm += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)
puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
#=> My string looks like this now: pumpkins
#=> My string looks like this now: pumpkins
# My string hasn't been modified by the method and stayed the same, 
# however my_array has been modified and new value appened to the array
# it's the operator << which mutates the caller and hence since it wasn't called 
# on my_string, object hasn't been changed. this is the result when operator in my_string
# changed to <<
#=> My string looks like this now: pumpkinsrutabaga
puts "End of trick method 1"
puts "---------------------------\n\n"

# Question 4
def tricky_method_two(a_string_parm, an_array_param)
  a_string_parm.gsub!('pumpkins', 'rutabaga')
  an_array_param = ["pumpkins", "rutabaga"]
end

my_string = 'pumpkins'
my_array = ['pumpkins']
tricky_method_two(my_string, my_array)
puts "My string looks like this now: #{my_string}"
#=> My string looks like this now: rutabaga
puts "My array looks like this now: #{my_array}"
#=> My array looks like this now: ["pumpkins"]

# As before, the explanation is all about what Ruby does with 
# its internal variables when we change the object it points to. 
# Does it create a new one? Or is it able to just modify the existing object?

# With the Array#= assignment, our literal ['pumpkins', 'rutabaga'] 
# array IS a new object, and we are setting the internal array variable equal 
# to that new array literal object.

# Question 5, how could the unnecessary duplication in this method be removed?
 
  # def color_valid(color)
  #   if color == "blue" || color == "green"
  #     true
  #   else
  #     false
  #   end
  # end

# Its the same as the above method but much simpler and easier to read
def color_valid(color)
  color == "blue" || "green"
end
