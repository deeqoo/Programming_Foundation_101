# Exercises: Easy 2

# Question 1
# In this hash of people and their age,
ages = {"Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10}
#ages.default = "nothing here"
p ages.key?("Spot")#puts ages["Spot"]
# Bonues
p ages.include?("Spot")
p ages.member?("Spot")
p ages.has_key?("Spot")

# Question 2, Add up all ages from the current family hash
ages = {"Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10}
puts ages.values.reduce(:+)


