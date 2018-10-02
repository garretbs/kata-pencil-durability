class Paper
	attr_reader :message
	
	def initialize()
		@message = ""
	end
	
	def add_text(text)
		@message <<= text
	end
	
	def erase(text)
		position = @message.rindex(text)
		return if position.nil?
		@message = @message.reverse.split(text.reverse, 2).join(" "*text.length).reverse
	end
end