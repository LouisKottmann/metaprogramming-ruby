class I
  def like arg
    puts "%s %s %s" % [self.class, self.class.instance_methods(false), arg]
  end
end

# write your code here to display 'I like metaprogramming.'
I.new.like "metaprogramming"

=begin OUTPUT

I [:like] metaprogramming

=end
