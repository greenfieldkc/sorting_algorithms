

class BucketSortable
  attr_accessor :array, :min, :max, :buckets, :sorted_array
  
  def initialize(input_array)
    @array = input_array
    @min = nil
    @max = nil
    if all_positive_integers?
      @array = input_array
    else
      @array = nil
      #raise TypeError
    end
    find_range
      
  end
  
  def all_positive_integers?
    @array.each do |i| 
      return false if (!(i.is_a? Integer ) || i < 0 )
    end
    return true
  end
  
  def find_range
    @array.each do |i|
      @min = i if @min == nil || i < @min
      @max = i if @max == nil || i > @max
    end
  end
      
  def create_buckets
    @buckets = Hash.new
    @min.upto(@max) {|i| @buckets[i] = 0}
  end
  
  def populate_buckets
    @array.each {|i| @buckets[i] += 1}
  end
  
  def create_sorted_array
    @sorted_array = []
    @min.upto(@max) do |i| 
      @buckets[i].times { @sorted_array << i }
    end
  end
  
end