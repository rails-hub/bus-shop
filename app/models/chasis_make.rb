class ChasisMake < ActiveRecord::Base
  belongs_to :bus
  validates_presence_of :name
end
