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
		message = "this is a simple message."
		pencil = Pencil.new(50)
		paper = Paper.new()
		pencil.write(message, paper)
		assert(paper.message == message)
	end
	
	def test_if_text_is_appended
		text1 = "this is the first message. "
		text2 = "second message. "
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
		durability = 50
		pencil = Pencil.new(50)
		paper = Paper.new()
		text = "this has some spaces in it"
		expected_durability = durability - text.scan(/\S/).count
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
	
	def test_uppercase_degradation
		durability = 50
		pencil = Pencil.new(durability)
		paper = Paper.new()
		text = "UPPERCASESTRING"
		pencil.write(text, paper)
		expected_durability = durability - (text.scan(/[A-Z]/).count*2)
		assert(pencil.durability == expected_durability)
	end
	
	def test_uppercase_and_lowercase_degradation
		durability = 50
		pencil = Pencil.new(durability)
		paper = Paper.new()
		text = "UPPERCASESTRINGwithsomelowercase"
		pencil.write(text, paper)
		expected_durability = durability - (text.scan(/[A-Z]/).count*2) - text.scan(/[a-z]/).count
		assert(pencil.durability == expected_durability)
	end
	
	def test_sharpen
		initial_durability = 10
		pencil = Pencil.new(initial_durability)
		paper = Paper.new()
		text = "four"
		pencil.write(text, paper)
		pencil.sharpen()
		assert(pencil.durability == initial_durability)
	end
	
	def test_length_decrement
		length = 5
		pencil = Pencil.new(10, length)
		pencil.sharpen()
		assert(pencil.length == length-1)
	end
	
	def test_short_pencil_will_not_sharpen
		length = 1
		durability = 20
		pencil = Pencil.new(durability, length)
		paper = Paper.new()
		text = "four"
		pencil.write(text, paper)
		pencil.sharpen()
		assert(pencil.durability == durability-text.length)
	end
	
	def test_last_occurrence_erased
		pencil = Pencil.new(50, 5)
		paper = Paper.new()
		text = "I am going to eat"
		text_to_erase = "to"
		expected_text_after_erase = "I am going    eat"
		pencil.write(text, paper)
		pencil.erase(text_to_erase, paper)
		assert(paper.message == expected_text_after_erase)
	end
	
	def test_only_last_occurrence_erased
		pencil = Pencil.new(50, 5)
		paper = Paper.new()
		text = "I am going to the store to buy something"
		text_to_erase = "to"
		expected_text_after_erase = "I am going to the store    buy something"
		pencil.write(text, paper)
		pencil.erase(text_to_erase, paper)
		assert(paper.message == expected_text_after_erase)
	end
	
	def test_multiple_occurrences_erased
		pencil = Pencil.new(50, 5)
		paper = Paper.new()
		text = "I am going to the store to buy something"
		text_to_erase = "to"
		expected_text_after_erase = "I am going    the s  re    buy something"
		pencil.write(text, paper)
		pencil.erase(text_to_erase, paper)
		pencil.erase(text_to_erase, paper)
		pencil.erase(text_to_erase, paper)
		assert(paper.message == expected_text_after_erase)
	end
	
	def test_eraser_degradation
		eraser_durability = 10
		pencil = Pencil.new(50, 5, eraser_durability)
		paper = Paper.new()
		text = "I am going to the store to buy something"
		text_to_erase = "something"
		expected_durability = eraser_durability-text_to_erase.length
		pencil.write(text, paper)
		pencil.erase(text_to_erase, paper)
		assert(pencil.eraser_durability == expected_durability)
	end
	
	def test_degraded_eraser_does_not_work
		eraser_durability = 3
		pencil = Pencil.new(50, 5, eraser_durability)
		paper = Paper.new()
		text = "I am going to the store to buy something"
		text_to_erase = "something"
		expected_text = "I am going to the store to buy someth   "
		pencil.write(text, paper)
		pencil.erase(text_to_erase, paper)
		assert(paper.message == expected_text)
	end
	
	def test_whitespace_does_not_degrade_eraser
		eraser_durability = 3
		pencil = Pencil.new(50, 5, eraser_durability)
		paper = Paper.new()
		text = "I am going to the store to buy something"
		text_to_erase = "y s"
		expected_durability = 1
		pencil.write(text, paper)
		pencil.erase(text_to_erase, paper)
		assert(pencil.eraser_durability == expected_durability)
	end
	
	def test_basic_editing
		pencil = Pencil.new(50, 5, 5)
		paper = Paper.new()
		text = "food"
		text_to_edit = "meow"
		pencil.write(text, paper)
		pencil.erase(text, paper, text_to_edit)
		assert(paper.message == text_to_edit)
	end
	
	def test_editing_with_not_enough_whitespace
		pencil = Pencil.new(50, 5, 5)
		paper = Paper.new()
		text = "Not much space here"
		text_to_edit = "verylongedithere"
		text_to_erase = "Not"
		expected_message = "very@@@@e@@@@@r@ere"
		pencil.write(text, paper)
		pencil.erase(text_to_erase, paper, text_to_edit)
		assert(paper.message == expected_message)
	end
	
	def test_editing_past_end_of_string
		pencil = Pencil.new(50, 5, 5)
		paper = Paper.new()
		text = "Not much space here"
		text_to_edit = "longstring"
		text_to_erase = "here"
		expected_message = "Not much space long"
		pencil.write(text, paper)
		pencil.erase(text_to_erase, paper, text_to_edit)
		assert(paper.message == expected_message)
	end
end

test = PencilTest.new
test.test_if_paper_receives_message
test.test_if_text_is_appended
test.test_pencil_degradation
test.test_pencil_degradation_unaffected_by_spaces
test.test_dull_pencil_writes_as_spaces
test.test_whitespace_does_not_degrade
test.test_uppercase_degradation
test.test_uppercase_and_lowercase_degradation
test.test_sharpen
test.test_length_decrement
test.test_short_pencil_will_not_sharpen
test.test_last_occurrence_erased
test.test_only_last_occurrence_erased
test.test_multiple_occurrences_erased
test.test_eraser_degradation
test.test_degraded_eraser_does_not_work
test.test_whitespace_does_not_degrade_eraser
test.test_basic_editing
test.test_editing_with_not_enough_whitespace
test.test_editing_past_end_of_string

