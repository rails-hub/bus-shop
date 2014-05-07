class PageHit < ActiveRecord::Base
  has_many :buses
  
  def get_stock_id
    self.url.split("/").last
  end
  
end
