animal = 'dog'

# define singleton speak() method
=begin
def animal.speak
	puts "#{capitalize} says Woof!"
end
=end

# define method in animal's eigenclass (same as above, really)
=begin
class << animal
	def speak
		puts "#{self.capitalize} says Woof!"
	end
end
=end

# through define_method
=begin
define_method(:speak) do
	puts "#{self.capitalize} says Woof!"
end
=end

# add the method to animal's instance
=begin
animal.instance_eval do
	def speak
		puts "#{capitalize} says Woof!"
	end
end
=end

# through an included module
=begin
module Speaker
	def speak
		puts "#{capitalize} says Woof!"
	end
end

animal.class.class_eval { include Speaker }
=end

# through an extended module (ok, I'm cheating a bit!)
=begin
module Speaker
  def self.extended(base)
     base.class_eval { include InstanceMethods }
  end

  module InstanceMethods
	  def speak
		  puts "#{capitalize} says Woof!"
    end
  end
end

animal.class.class_eval { extend Speaker }
=end


animal.speak  #=> 'Dog says Woof!'

