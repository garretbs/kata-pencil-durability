require_relative 'pencil.rb'
require_relative 'paper.rb'

class PencilTest

	def initialize()
		@pencil = Pencil.new()
		@paper = Paper.new()
	end

	def assert(condition)
		raise "AssertionError" unless condition
	end
	
	def test_if_paper_receives_message
		message = "This is a simple message."
		@pencil.write(message, @paper)
		assert(@paper.message == message)
	end
	
	def test_if_text_is_appended
		text1 = "This is the first message. "
		text2 = "Second message. "
		expected_result = @paper.message << text1 << text2
		@pencil.write(text1, @paper)
		@pencil.write(text2, @paper)
		assert(@paper.message == expected_result)
	end
end

test = PencilTest.new
test.test_if_paper_receives_message
test.test_if_text_is_appended

