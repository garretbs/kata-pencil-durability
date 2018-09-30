class Pencil
	attr_reader :durability
	
	def initialize()
		@durability = 0
	end
	
	def write(message, paper)
		paper.add_text(message)
	end
	
	def erase()
	end
	
	def sharpen()
	end
	
	def edit()
	end
end