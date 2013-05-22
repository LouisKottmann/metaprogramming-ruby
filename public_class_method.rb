module ClassLeveler
	def level_up
		puts "up'd!"		
		puts self.class.name
	end
end

class LowLevel
	class << self
		include ClassLeveler
	end
	
	def low_level
		puts "I'm low.."
		puts self.class.name
	end
end

class NLevel
end

ll = LowLevel.new

ll.low_level


LowLevel.level_up

puts NLevel.respond_to? "level_up"

=begin OUTPUT

I'm low..
LowLevel
up'd!
Class
false

=end
