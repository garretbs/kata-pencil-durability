class Pencil
	attr_reader :durability
	
	def initialize(durability)
		@durability = durability
	end
	
	def write(message, paper)
		paper.add_text(message)
		@durability -= message.length
	end
	
	def erase()
	end
	
	def sharpen()
	end
	
	def edit()
	end
end