ret = class A
  def initialize
    @a = 11
    @@a = 22
    a = 33
  end
  @a = 1
  @@a = 2
  a = 3
end


class K < A
	def initialize
		puts super
	end
end

class A 
	class << self
		attr_accessor :a
	end
end

puts A.a # 1
class M < A
	puts @@a #2
end
puts ret #3

b = A.new
puts b.instance_variable_get(:@a) #11
puts A.class_variable_get(:@@a) #22
K.new #33

=begin OUTPUT

1
2
3
11
22
33

=end

