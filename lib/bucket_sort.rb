require 'benchmark'

class BucketSort
  
  def initialize(integer_array)
    puts "i am inside initialize"
    if ensure_integers?(integer_array)
      @array = integer_array 
    else
      raise ArgumentError, "Input array has negative or non-integer values."
    end
    @min = nil
    @max = nil
    get_max_min(@array)
  end
  
  def ensure_integers?(array)
    array.each { |i| return false if !(array[i].is_a?(Integer) && array[i] > 0)}
  end
  
  def get_max_min(array)
    array.each do |i|
      @min = array[i] if (@min == nil || array[i] < @min)
      @max = array[i] if (@max == nil || array[i] > @max)
    end
  end
    
    
  def bucket_sort(int_array, min, max)
    @buckets = Hash.new
    min.upto(max).each {|x| @buckets[x] = 0 }
    int_array.each_index { |i| @buckets[int_array[i]] += 1 if @buckets.has_key? int_array[i] }
    sorted_array = []
    min.upto(max).each do |x| 
      @buckets[x].times { sorted_array << x }
    end
    print sorted_array
  end
  
  def generate_random_array(size, min, max)
    array = []
    size.times { Random.new.rand(min..max) }
    return array
  end
  
end
=begin
a = []
10000.times {a << Random.new.rand(0..200)}
b = a
test = BucketSortable.new(a)


time = Benchmark.realtime do
  test.bucket_sort(a, 0, 200)
end

time2 = Benchmark.realtime do
  b.sort
end

puts "time1 is: #{time}"
puts "time2 is: #{time2}"

error_array = ["dfsf",0.4, 3, "oops"]
test_error = BucketSortable.new(error_array)

=end