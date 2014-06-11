require 'spec_helper'

class BucketSortable
  describe BucketSortable do
    describe "#initialize" do
      it "outputs 'i am inside initialize'" do
        bucket = BucketSortable.new [3,5,4,67,4]
        output.should_be "i am inside initialize"
      end
      it "ensures input is an integer array"
      it "raises an ArgumentError if ensure_integers? returns false" do
        bucket = BucketSortable.new ['a',3,6,'d']
      end
      it "instantiates @min to nil"
      it "instantiates @max to nil"
      it "gets max and min values of input"
    end
    
    describe "#ensure_integers?" do
      it "returns true if input is an array with only positive integers" do
        pending
        bucket = BucketSortable.new [3,5,4,67,4]
        bucket.ensure_integers?([3,5,4,67,4]).should_be true
      end
      it "returns false if input is not an array"
      it "returns false if array contains non-integers"
      it "returns false if array contains negative integers"
    end
    
    describe "#get_max_min" do
      it "sets @min to the array's min value"
      it "sets @max to the array's max value"
    end
      
  end
end