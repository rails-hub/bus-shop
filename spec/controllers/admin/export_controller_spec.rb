require 'spec_helper'

describe Admin::ExportController do

  describe "GET 'to_pdf'" do
    it "returns http success" do
      get 'to_pdf'
      response.should be_success
    end
  end

  describe "GET 'to_xls'" do
    it "returns http success" do
      get 'to_xls'
      response.should be_success
    end
  end

end
