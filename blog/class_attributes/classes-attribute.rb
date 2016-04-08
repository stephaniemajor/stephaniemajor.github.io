class Refrigerator
	attr_reader :name, :top_shelf, :middle_shelf, :bottom_shelf # Note a

	def initialize(name)
		@name = name
		@top_shelf = Hash.new(0)
		@middle_shelf = Hash.new(0)
		@bottom_shelf = Hash.new(0)
	end  # this is to close initialization

# Create a method to add items to our refrigerator
	def add(shelf_position, item, quantity) # Note b
		case shelf_position # Note c
		when "top"
			@top_shelf[item] += quantity
		when "middle"
			@middle_shelf[item] += quantity
		when "bottom"
			@bottom_shelf[item] += quantity
		else
			puts "Shelf not recognized (use \"top\", \"middle\", \"bottom\")"
		end
	end

#Create a method to delete items from our refrigerator
	def delete(shelf_position, item, quantity) # Note d
		case shelf_position # Note e
			when "top" 
				if @top_shelf[item] < quantity
					puts "There is only #{top_shelf[item]} #{item} on the top shelf"
				else 
					@top_shelf[item] -= quantity
				end	
			when "middle"
				if @middle_shelf[item] < quantity
					puts "There is only #{middle_shelf[item]} #{item} on the middle shelf"
				else 
					@middle_shelf[item] -= quantity
				end	
			when "bottom"
				if @bottom_shelf[item] < quantity
					puts "There is only #{bottom_shelf[item]} #{item} on the bottom shelf"
				else 
					@bottom_shelf[item] -= quantity
				end
			else	
				puts "Shelf not recognized (use \"top\", \"middle\", \"bottom\")"
		end
	end
end # this is to close my class

#In this case, if a create my downstairs refrigerator, I will do:
downstairs = Refrigerator.new("downstairs")
# To add items in my refrigerator, I would do
downstairs.add("top","milk",2) # Note f
downstairs.add("top","butter",3)
downstairs.add("top","yogurt",10)
downstairs.add("middle","steak",4)
downstairs.add("middle","chicken wings",36)
downstairs.add("middle", "pot pie",1)
downstairs.add("bottom","lettuce",1)
downstairs.add("bottom","carrots",32)
downstairs.add("bottom","mushroom pack",2)

puts downstairs.top_shelf
puts downstairs.middle_shelf
puts downstairs.bottom_shelf

# To delete in my refrigerator, I would do
downstairs.delete("top","yogurt",6) #Note g
downstairs.delete("middle","pot pie",1)
downstairs.delete("bottom","mushroom pack",3)

# To see what is in my refrigerator, I would do
puts downstairs.top_shelf
puts downstairs.middle_shelf
puts downstairs.bottom_shelf

# Returned:
# There is only 2 mushroom pack on the bottom shelf. Note h
# {"milk"=>2, "butter"=>3, "yogurt"=>4}                                                                                                                                                                                                      
# {"steak"=>4, "chicken wings"=>36, "pot pie"=>0}                                                                                                                                                                                            
# {"lettuce"=>1, "carrots"=>32, "mushroom pack"=>2}   


# The class with methods has the advantage that I create a guarantee to avoid a negative number 
# while the class without methode  might return a negative quantity if we have reduced for more than is in the refrigerator. 
# I do this by incorporing in my method: 	if @top_shelf[item] < quantity
# 			puts "There is only #{top_shelf[item]} on the shelf"
# Note a: # They are attribute reader because nobody can change them once they have been created
# You cannot change their name
# Note b: When we call the method add, we need to provide it with 3 arguments
# Note c: the case must have the name of the variable we are casing
# Note d: When we call the method delete, we need to provide it with 3 arguments
# Note e: the case must have the name of the variable we are casing
# Note f: we are calling the method add for our downstairs refrigerator
# Note g: we are calling the method delete for our downstairs refrigerator
# Note h: A message is printed for us but the program did not do anything else about it because we did not give any other instructions  