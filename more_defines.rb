MaskedString = Class.new(String) do
	instance_eval do
		define_method :tr_vowel do
			tr 'aeiou', '*'
		end
	end		
	
	class << self	
		define_method :tr_vowel do |str|
			str.tr 'aeiou', '*'
		end
	end
end

ff = MaskedString.new "lol"
puts ff.tr_vowel

puts MaskedString.tr_vowel "lool"

=begin OUTPUT

l*l
l**l


=end
