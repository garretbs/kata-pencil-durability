class Paper
	attr_reader :message
	
	def initialize()
		@message = ""
	end
	
	def add_text(text)
		@message <<= text
	end
	
	def erase(text)
		@message.delete!(text)
	end
end