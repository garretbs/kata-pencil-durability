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
	
end

test = PencilTest.new
test.test_if_paper_receives_message