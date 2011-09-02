# stakk.rb
#==Instantiate a Go::CallStack object
#
# This is the way to create a Stakk object that contains a full stack trace
# that is easy to get data out of.
#
#  stack = get_stakk      # stack starting from one up the caller stack             
#  stack = get_stakk(1)   # stack starting from one up the caller stack
#  stack = get_stakk(0)   # stack starting from this line
#
# The traditional way to instantiate a Stakk
#
#  stack = Stakk.new( caller )       # look one up the caller stack
#  stack = Stakk.new( caller(1) )    # Same as above
#  stack = Stakk.new( caller(0) )    # get callstack at this line in code
#  
#== Methods
#
# Get one item in the stack
#
#  item = stack[0]
#  item.line              -> 5
#  item.value             -> "./go/util/caller/caller.test.rb:6:in `test_caller'"
#  item.to_s              -> same as above 
#  item.path              -> path to stack item
#  item.path( 'file.html' )  -> path to other file in same dir as stack item
#  item.dir               -> dir of stack item
#  item.join( subpath )   -> join subpath to item.dir
#  item.method_name       -> name of method. Didn't use #method because of conflict
#  
# Stakk methods
#
#  stack.to_a
#  stack.each
#  stack[0]
#  stack[0..3]

class Stakk
  
  include Enumerable
  
  # CallStack takes an array that is returned by the method Kernel#caller.
  def initialize( array )
    @array = array
    @items = []
  end
  
  attr_reader :array, :items
  
  # Returns the CallStack::Item at the nth position up the stack or if given
  # a range, returns a new GoCallStack object with that portion of the array
  # of initial caller items.
  def []( arg )
    if arg.is_a?( Range )
      Stakk.new( array[ arg ] )
    else
      items[ arg ] ||= Stakk::Item.new( array[ arg ] )
    end
  end
  
  # Iterates over each item in the CallStack
  def each
    array.each_with_index do |item,i|
      yield self[i]
    end
  end
  
  # Returns all CallStack::Item objects as an array
  def to_a
    i = 0
    @array.map do |stack_line_value|
      item = self[i]
      i += 1
      item
    end
  end
  
end