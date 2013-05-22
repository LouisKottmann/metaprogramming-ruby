class A
	@@a = 1
	@a = 2
	a = 3

	@binding = binding
	
	class << self
		attr_accessor :binding
	end
end 

p eval('[@@a, @a, a]', A.binding)

=begin OUTPUT

[1, 2, 3]

=end