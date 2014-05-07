require 'spec_helper'

describe "AddNewBuses" do
  it "should add new bus with all the validations" do
   bus = mock_model(Bus)
   visit new_admin_session_path
   fill_in "admin[email]", :with => "narang.jasdeep@gmail.com"
   fill_in "admin[password]", :with => "iamadmin"
   click_button("contactSubmitBtn")
   #response
  end
end
