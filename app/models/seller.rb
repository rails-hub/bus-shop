class Seller < ActiveRecord::Base
  has_one :bus
#  validates_presence_of :name, :on => :create, :message => "can't be blank"
  attr_accessible :name , :phone, :email, :comments, :postal_code, :address, :province, :city, :company_name, :country
end
