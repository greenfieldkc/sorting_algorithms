require 'spec_helper'

class BucketSortableSpec
  
  describe BucketSortable do
    describe "#initialize" do
      it "should set input argument to @array variable" do
        arr = [1,2,3,4,5,6]
        bucket = BucketSortable.new(arr)
        bucket.array.should == arr
      end
      
      describe "@array" do  
        it "should be an array" do
          arr = [1,2,3,4,5,6]
          bucket = BucketSortable.new(arr)
          bucket.array.should be_an Array
        end
        it "should be all positive integers" do
          arr = [1,2,3,4,5,6]
          bucket = BucketSortable.new(arr)
          bucket.should be_all_positive_integers
        end
      end #end describe array
      
      it "should raise an TypeError if all_positive_integers? is false" do
          pending
          arr = [-3, "df", 4, 5, 6.3]
          bucket = BucketSortable.new(arr)
          bucket.should_raise TypeError
      end
      
      it "should have a non-nil @min variable" do
        arr = [1,2,3,4,5,6]
        bucket = BucketSortable.new(arr)
        bucket.min.should_not be_nil
      end
        
      it "should have a non-nil @max variable" do
        arr = [1,2,3,4,5,6]
        bucket = BucketSortable.new(arr)
        bucket.max.should_not be_nil
      end
      
    end #end describe initialize
    
    describe "#all_positive_integers?" do
      it "should return false if @array contains a string" do
        bucket = BucketSortable.new [1,2,3]
        bucket.array = [1,2,'fd',5]
        bucket.all_positive_integers?.should be_false
      end
      it "should return false if @array contains a float" do
        bucket = BucketSortable.new [1,2,3]
        bucket.array = [2.3, 5, 8, 9, 10.2]
        bucket.all_positive_integers?.should be_false
      end
      it "should return false is @array contains a negative integer" do
        bucket = BucketSortable.new [1,2,3]
        bucket.array = [4,-3,2,1]
        bucket.all_positive_integers?.should be_false
      end
      it "should return true if @array only contains positive integers" do
        array = [1,2,3,4,5]
        bucket = BucketSortable.new(array)
        bucket.all_positive_integers?.should be_true
      end
    end #end describe all_positive_integers?
    
    describe "#find_range" do
      it "should set @min to minimum value of @array" do
        bucket = BucketSortable.new [2,6,4,8,3,1]
        bucket.find_range
        bucket.min.should == 1
      end
      
      it "should set @max to maximum value of @array" do
        bucket = BucketSortable.new [2,6,4,8,3,1]
        bucket.find_range
        bucket.max.should == 8
      end
    end #end describe find_range
    
    describe "#create_buckets" do
      it "should instantiate a @buckets hash" do
        bucket = BucketSortable.new [1,2,3,4,5,6]
        bucket.create_buckets
        bucket.buckets.should be_a Hash
      end
      
      it "should create keys for every integer in range" do
        bucket = BucketSortable.new [1,2,4,4,3,4,5,6]
        bucket.create_buckets
        bucket.buckets.should have(6).keys
      end
      
      it "should set all key values to zero" do
        bucket = BucketSortable.new [1,2,4,3,4,5,6]
        bucket.create_buckets
        bucket.buckets.values.each {|v| v.should == 0}
      end
        
    end #end describe create_buckets
    
    describe "populate_buckets" do
      it "should increment hash value by 1 if there is 1 occurrence of key" do
        bucket = BucketSortable.new [1,2,4,4,5,6]
        bucket.create_buckets
        expect {bucket.populate_buckets}.to change{bucket.buckets[1]}.from(0).to(1)
      end
      
       it "should increment hash value by 2 if there are 2 occurrences of key" do
          bucket = BucketSortable.new [1,2,4,4,5,6]
          bucket.create_buckets
          expect {bucket.populate_buckets}.to change{bucket.buckets[4]}.from(0).to(2)
       end
       
       it "should not increment hash value if there are 0 instances of key" do
         bucket = BucketSortable.new [1,2,4,4,5,6]
         bucket.create_buckets
         bucket.populate_buckets
         bucket.buckets[3].should == 0
       end
      
    end #end describe populate_buckets
    
    describe "create_sorted_array" do
      it "should instantiate a @sorted_array variable with same length of array" do
        bucket = BucketSortable.new [1,4,3,2,5,2,6]
        bucket.create_buckets
        bucket.populate_buckets
        bucket.create_sorted_array
        bucket.sorted_array.length.should == bucket.array.length
      end
      
      it "should iterate through all Hash keys" do
        pending "some Googling about checking action calls"
      end
      describe "@sorted_array" do
        it "should be in sorted order" do
          bucket = BucketSortable.new [1,4,3,2,5,2,6]
          bucket.create_buckets
          bucket.populate_buckets
          bucket.create_sorted_array
          bucket.sorted_array.should == bucket.array.sort
        end
      end
    end #end describe create_sorted_array
    
    
  end #end describe BucketSortable
  
  
end