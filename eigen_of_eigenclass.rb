class Object
	def eigenclass
		class << self
			self
		end
	end
end

puts Object.new.eigenclass
puts Object.new.eigenclass.eigenclass
puts Object.new.eigenclass.eigenclass.superclass.inspect