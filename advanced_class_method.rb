class Rubyist
  def initialize name
    @name = name
    @count = 0
  end

  def say!
    puts 'hello'
  end
end

satish = Rubyist.new('Satish')

3.times{satish.say!}

puts '-' * 20

module RubyLearning
	module Module
		def alias_helper(method, characteristic)
			method_name = method.to_s
			characteristic_name = characteristic.to_s

			#this is to put forward any punctuation towards the end of the method's new name
			if %w(= ? !).any?{ |c| method_name.end_with?(c) }
				punc = method_name[-1]
				method_name = method_name[0..-2]
				characteristic_name += punc
			end

      method_with, method_without, method_intermediate =
          "#{method_name}_with_#{characteristic_name}",
          "#{method_name}_without_#{characteristic_name}",
          "intermediate_#{method_name}_with_#{characteristic_name}"

			alias_method method_without, method
			
			#this will enforce validation through a block passed as parameter
			define_method(method_intermediate) do
				if yield(instance_variable_get("@#{characteristic}"))
					send(method_with)
				else					
					send(method_without)
				end
			end
			
			alias_method method, method_intermediate
		end	
	end
end

class Rubyist
	extend RubyLearning::Module
  
	def say_with_count!
		@count += 1
		puts "#{@name}(#{@count}) says hello" 
	end	
	alias_helper :say!, :count do |counter|
		counter < 3
	end
end

5.times{satish.say!}

=begin OUTPUT
hello
hello
hello
--------------------
Satish(1) says hello
Satish(2) says hello
Satish(3) says hello
hello
hello
=end

