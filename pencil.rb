class Pencil
	attr_reader :durability
	attr_reader :length
	attr_reader :eraser_durability
	
	def initialize(durability, length = 2, eraser_durability = 15)
		@initial_durability = durability
		@length = length
		@durability = durability
		@eraser_durability = eraser_durability
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
	
	def erase(text, paper)
		amount_to_erase = [@eraser_durability, text.length].min
		@eraser_durability -= text.gsub("\s", "").length
		text_to_erase = text[text.length-amount_to_erase, amount_to_erase]
		paper.erase(text_to_erase)
	end
	
	def sharpen()
		return if (@length -= 1) < 1
		@durability = @initial_durability
	end
	
	def edit(paper, text)
	end
end