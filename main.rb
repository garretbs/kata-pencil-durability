require_relative 'pencil.rb'

class PencilTest

	def initialize()
	end

	def assert(condition)
		raise "AssertionError" unless condition
	end
	
end

test = PencilTest.new