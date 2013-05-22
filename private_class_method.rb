module CheckedAttributes
	def self.included(base)
		base.extend(ClassMethods)
	end

	module ClassMethods
		private
		def attr_checked(sym, &validator)
			attr_name = sym.to_s		
				
			define_method(sym) do
				instance_variable_get "@#{attr_name}"
			end
	
			define_method("#{attr_name}=") do |v|
				raise RuntimeError unless validator.call(v)
				instance_variable_set("@#{attr_name}", v)
			end
		end
	end
end

class Person
	include CheckedAttributes
	
	attr_checked :age do |v|
		v.to_i >= 18
	end
end

me = Person.new
puts me.age
me.age = 39 # OK
puts me.age
me.age = 12 # Exception!
puts me.age

=begin OUTPUT

39
RuntimeError

=end