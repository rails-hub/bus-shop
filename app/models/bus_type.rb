class BusType < ActiveRecord::Base
  has_many :buses
  validates_presence_of :name
  validates_uniqueness_of :name, :on => :create, :message => 'must be unique'
  validates_uniqueness_of :slug, :on => :create, :message => 'must be unique'
  
  before_save :upcase_name, :make_url_slug
  
  def upcase_name
    self.name.titleize
  end
  
  def make_url_slug
    self.slug = self.name.parameterize
  end
  
end
