class Refrigerator
	attr_reader :name #Note 1

	attr_accessor :top_shelf, :middle_shelf, :bottom_shelf #Note 2

	def initialize(name)
		@name = name
		@top_shelf = Hash.new(0) # Note 3
		@middle_shelf = Hash.new(0)
		@bottom_shelf = Hash.new(0)
	end # this is to close initialization
end # this is to close my class

# If I create my kitchen refrigerator, I will do:
kitchen = Refrigerator.new ("kitchen")

# To add items in my refrigerator, I would do
kitchen.top_shelf["milk"] = 2 # Note 4:
kitchen.top_shelf["butter"] =3
kitchen.top_shelf["yogurt"] =10
kitchen.middle_shelf["steak"] = 4
kitchen.middle_shelf["chicken wings"] = 36
kitchen.middle_shelf["pot pie"] = 1
kitchen.bottom_shelf["lettuce"] = 1
kitchen.bottom_shelf["carrots"] = 32
kitchen.bottom_shelf["mushroom pack"] = 2

# To delete in my refrigerator, I would do
kitchen.top_shelf["yogurt"] -= 6
kitchen.middle_shelf["pot pie"] -= 1
kitchen.bottom_shelf["mushroom pack"] -= 3

# To see what is in my refrigerator, I would do
puts kitchen.top_shelf
puts kitchen.middle_shelf
puts kitchen.bottom_shelf

# returned:
# {"milk"=>2, "butter"=>3, "yogurt"=>4}                                                                                                                                                                                                      
# {"steak"=>4, "chicken wings"=>36, "pot pie"=>0}                                                                                                                                                                                            
# {"lettuce"=>1, "carrots"=>32, "mushroom pack"=>-1}. Note 5 
# 

# The class with methods has the advantage that I can create a guarantee, via a method, that the requested action will make sense
# It this case, one of the method includes a provision to avoid a negative quantity
# I do this by incorporing in my method: 	if @top_shelf[item] < quantity
# 			puts "There is only #{top_shelf[item]} on the shelf"
# While the class without methods  might return a negative quantity if we have reduced for more than is in the refrigerator. 
#Note 1: The refrigerator name is an attribute reader because nobody can change its name once created
#Note 2: These are attribute accessor meaning you can read or write what you want
#Note 3: we are create an empy place having a key, the name of the food, and a variable, the quantity for the said food
# Note 4: the key is the milk, the variable is the 2, the quantity
# Note 5: The program did exactly what the person said, even if it doesn't make sense to take out more than is in the refrigerator => there is no control in place