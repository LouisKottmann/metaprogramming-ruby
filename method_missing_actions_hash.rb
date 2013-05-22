MSGS = 
{
	:dance => 'is dancing', 
	:poo => 'is a smelly doggy!', 
	:laugh => 'finds this hilarious!'
}

class Dog
	attr_accessor :actions, :name

	def initialize(name)
		@name = name
		@actions = {}
	end
	
	def can(*actions, &block)
		actions.each do |a|			
			unless @actions.include?(a)
				if block.nil?
					@actions[a] = "#{@name} #{MSGS[a]}"
				else
					@actions[a] = instance_eval &block
				end
			end
		end
	end
	
	def method_missing(name, *args, &block)
		if @actions.include?(name)
			@actions[name]
		else
			"#{@name} doesn't understand #{name}"			
		end
	end
end

lassie, fido, stimpy = %w[Lassie Fido Stimpy].collect{|name| Dog.new(name)}
lassie.can :dance, :poo, :laugh
fido.can(:poo){ "#{name} is smelly." }
stimpy.can :dance
stimpy.can(:cry){ "#{name} cried AHHHH" }

p lassie.dance
p lassie.poo
p lassie.laugh
puts
p fido.dance
p fido.poo
p fido.laugh
puts
p stimpy.dance
p stimpy.poo
p stimpy.laugh
p stimpy.cry

=begin OUTPUT
"Lassie is dancing"
"Lassie is a smelly doggy!"
"Lassie finds this hilarious!"

"Fido doesn't understand dance"
"Fido is smelly."
"Fido doesn't understand laugh"

"Stimpy is dancing"
"Stimpy doesn't understand poo"
"Stimpy doesn't understand laugh"
"Stimpy cried AHHHH"
=end