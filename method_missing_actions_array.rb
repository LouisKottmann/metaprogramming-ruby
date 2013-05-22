MSGS = 
{
	:dance => 'is dancing', 
	:poo => 'is a smelly doggy!', 
	:laugh => 'finds this hilarious!'
}

class Dog
	attr_accessor :actions

	def initialize(name)
		@name = name
		@actions = []
	end
	
	def can(*actions)
		actions.each do |a|
			@actions << a unless @actions.include?(a)
		end
	end
	
	def method_missing(name, *args, &block)
		if @actions.include?(name)
			"#{@name} #{MSGS[name]}"
		else
			"#{@name} doesn't understand #{name}"			
		end
	end
end

lassie, fido, stimpy = %w[Lassie Fido Stimpy].collect{|name| Dog.new(name)}
lassie.can :dance, :poo, :laugh
fido.can :poo
stimpy.can :dance

p lassie.actions

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

=begin OUTPUT
"Lassie is dancing"
"Lassie is a smelly doggy!"
"Lassie finds this hilarious!"

"Fido doesn't understand dance"
"Fido is a smelly doggy!"
"Fido doesn't understand laugh"

"Stimpy is dancing"
"Stimpy doesn't understand poo"
"Stimpy doesn't understand laugh"
=end