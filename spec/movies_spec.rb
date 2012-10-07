require 'spec_helper'

describe Movie do
	describe "find movies with similar director" do
    describe "director does not exist" do
      it "should return an empty array" do
        Movie.find_all_by_director(nil).should == []
      end
    end
    
    describe "director exists" do
      it "should return an array with movies" do
        Movie.should_receive(:find_all_by_director).with('x')
        Movie.find_all_by_director('x')
      end
    end
  end
end


