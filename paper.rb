class Paper
	attr_reader :message
	
	def initialize()
		@message = ""
	end
	
	def add_text(text)
		@message <<= text
	end
	
	def erase(text, edit_text)
		position = @message.rindex(text)
		return if position.nil?
		@message = @message.reverse.split(text.reverse, 2).join(" "*text.length).reverse
		if edit_text
			end_position = [@message.length, position+edit_text.length].min - 1
			edit_text_position = -1
			for i in position..end_position
				edit_text_position += 1
				@message[i] = @message[i] =~ /\s/ ? edit_text[edit_text_position] : "@"
			end
		end
	end
end