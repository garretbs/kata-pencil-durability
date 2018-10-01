require_relative 'pencil.rb'
require_relative 'paper.rb'

class PencilTest

	def initialize()
		#@pencil = Pencil.new(120)
		#@paper = Paper.new()
	end

	def assert(condition)
		raise "AssertionError" unless condition
	end
	
	def test_if_paper_receives_message
		message = "This is a simple message."
		pencil = Pencil.new(50)
		paper = Paper.new()
		pencil.write(message, paper)
		assert(paper.message == message)
	end
	
	def test_if_text_is_appended
		text1 = "This is the first message. "
		text2 = "Second message. "
		pencil = Pencil.new(50)
		paper = Paper.new()
		expected_result = paper.message + text1 + text2
		pencil.write(text1, paper)
		pencil.write(text2, paper)
		assert(paper.message == expected_result)
	end
	
	def test_pencil_degradation
		pencil = Pencil.new(50)
		paper = Paper.new()
		initial_durability = pencil.durability
		pencil.write("qwertyuiop", paper)
		assert(pencil.durability < initial_durability)
	end
	
	def test_pencil_degradation_unaffected_by_spaces
		pencil = Pencil.new(50)
		paper = Paper.new()
		initial_durability = pencil.durability
		text = "This has some spaces in it"
		number_of_whitespace = text.scan(/\s/).count
		expected_durability = initial_durability - (text.length - number_of_whitespace)
		pencil.write(text, paper)
		assert(pencil.durability == expected_durability)
	end
	
	def test_dull_pencil_writes_as_spaces
		durability = 50
		pencil = Pencil.new(durability)
		paper = Paper.new()
		text = "thisisabitoftextthatshouldrunoutthedurabilityofthepencil"
		pencil.write(text, paper)
		expected_message = text[0, durability] + (" " * (text.length-durability))
		assert(paper.message == expected_message)
	end
	
	def test_whitespace_does_not_degrade
		durability = 50
		pencil = Pencil.new(durability)
		paper = Paper.new()
		text = "w h i t e s p a c e"
		pencil.write(text, paper)
		expected_durability = durability - text.scan(/\S/).count
		assert(pencil.durability == expected_durability)
	end
end

test = PencilTest.new
test.test_if_paper_receives_message
test.test_if_text_is_appended
test.test_pencil_degradation
test.test_pencil_degradation_unaffected_by_spaces
test.test_dull_pencil_writes_as_spaces
test.test_whitespace_does_not_degrade

