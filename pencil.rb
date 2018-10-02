class Pencil
	attr_reader :durability
	attr_reader :length
	
	def initialize(durability, length = 2)
		@initial_durability = durability
		@length = length
		@durability = durability
	end
	
	def write(message, paper)
		message.split("").each do |character|
			if @durability < 1
				paper.add_text(" ")
			else
				paper.add_text(character)
				if character =~ /[A-Z]/ #uppercase
					@durability -= 2
				elsif character =~ /\S/ #lowercase, other non-whitespace symbols
					@durability -= 1
				end
			end
		end
	end
	
	def erase()
	end
	
	def sharpen()
		return if (@length -= 1) < 1
		@durability = @initial_durability
	end
	
	def edit()
	end
end