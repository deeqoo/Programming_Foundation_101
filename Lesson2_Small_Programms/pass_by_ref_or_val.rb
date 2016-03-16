# Pass by Refence vs Pass by Value

def change_name(name)
  name = "bob"
end

name = 'jim'
change_name(name)
# will the name be changed?
puts name # no => jim

# when we passed name to change_name(name) method it didn't change the value of name
# and had no effect of the name variable in main scope. looks like pass by value

# Pass by reference
def cap(str)
  str.capitalize!
end

name = 'jim'
cap(name)
# is name being modifed by the method?
puts name 
# answer is yes #=> Jim returned captitalized name therefor the operation of the metod
# affected the original object, re-assigning the var. This implies ruby is pass by reference 

# non destructive method for capitalizing str
def cap(str)
  str.capitalize
end

name = "jim"
cap(name)
puts name # => jim, original object not modified by the method

# As you can see from the previous examples, Ruby exhibits a combination 
# of behaviors from both "pass by reference" as well as "pass by value". 
# Some people call this pass by reference of the value or call by sharing. 
# Whatever you call it, the most important concept you should remember is:
  # when an operation within the method mutates the caller, it will affect the original object. 

# destructive methods don't always end with !
def add_name(arr, name)
  arr = arr << name
end

# re-assignment is not considered a destructive operaton
def add_another_name(arr, name)
  arr = arr + [name] 
end
puts "add name method"

names = ["bob", "kim"]
puts add_name(names, "jim")
puts names.inspect