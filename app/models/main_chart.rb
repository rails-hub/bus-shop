class MainChart < ActiveRecord::Base
  validates_uniqueness_of :dates
end
