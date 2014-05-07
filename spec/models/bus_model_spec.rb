require 'spec_helper'

describe "Buses" do
  before(:each) do
    @bus = Factory.create(:bus)
  end
  
  it "should be invalid when sold is selected but sold_price is left blank" do
    @bus.sold_price = nil
    @bus.errors_on(:sold_price).should_not be_nil
    @bus.should_not be_valid
  end
  
  it "should be valid when sold is selected and sold_price is entered" do
    @bus.errors_on(:sold_price).should be_blank
    @bus.should be_valid
  end
  
  it "should upcase the Interior & exterior Color after save" do
    @bus.exterior_color = "red"
    @bus.interior_color = "black"
    @bus.save.should be_true
    @bus.exterior_color.should == "Red"
    @bus.interior_color.should == "Black"
  end
  
end
