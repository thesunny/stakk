module Kernel
  
  def get_stakk(start=1)
    Stakk.new( caller(start+1) )
  end
  
end