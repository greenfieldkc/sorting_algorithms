require 'spec_helper'

class RadixSortable
  describe RadixSortable do
    it "should respond to all_positive_integers?" do
      radix = RadixSortable.new
      radix.respond_to?(:all_positive_integers?).should be_true
    end
    
    it "should respond to find_range" do
      radix = RadixSortable.new
      radix.respond_to?(:find_range).should be_true
    end
    
    it "should respond to create_buckets" do
      radix = RadixSortable.new
      radix.respond_to?(:create_buckets).should be_true
    end
    
    it "should respond to populate_buckets" do
      radix = RadixSortable.new
      radix.respond_to?(:populate_buckets).should be_true
    end
    
    it "should respond to create_sorted_array" do
      radix = RadixSortable.new
      radix.respond_to?(:create_sorted_array).should be_true
    end
    
    describe "#initialize" do
      pending
    end #end describe initialize
    
    
  end #end describe RadixSortable
end