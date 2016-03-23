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
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, 
         "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# Adding up all values in array
puts ages.values.inject(:+)

# Question 3, In the age hash:
ages = {"Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10}
ages.delete_if {|key, value| value >= 100 }
p ages

# Question 4, Starting with string:
munsters_description = "The Munsters are creepy in a good way."
puts munsters_description.capitalize!
puts munsters_description.swapcase!
puts munsters_description.downcase!
puts munsters_description.upcase!

# Question 5, add ages for Marilyn and Spot for the existing hash
ages = {"Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10}
additional_ages = {"Marilyn" => 22, "Spot" => 237}
ages.merge!(additional_ages)

# Quesiton 6, Pick out the minimum age from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, 
          "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.min

# Question 7, See if the name 'Dino' appears in the string below
advice = "Few things in life are as important as house training your pet dinosour"
p advice.match("Dino")
p advice.include?("Dino") # another way of doing it.

# Question 8, In the array below:
flinstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
puts "Find index"
find_index = flinstones.index {|index| index.start_with?("Be")}
# flintstones.index { |name| name[0, 2] == "Be" } # another way to do. 
puts "Index of the fist name that start with 'Be' is: #{find_index}"

# Questin 9, Using 'array#map!', shorten each of these names to just 3 characters
flinstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
three_char = flinstones.map! do |name| 
  name[0,3]
end
#three_char

# Question 10, Again shorten these names to just 3 characters, but doing all on one line.
p flinstones.map!{|name| name[0,3]}
