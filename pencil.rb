class Pencil
	attr_reader :durability
	
	def initialize(durability)
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
	end
	
	def edit()
	end
end