puts 1 + 1

class Fixnum
	alias :old_plus :+
	def +(num)
		old_plus(num).old_plus(1)
	end
end

puts 1 + 1
puts 2 + 5

=begin OUTPUT

2
3
8

=end