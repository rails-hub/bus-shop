class Parent < ActiveRecord::Base

	Parent.abstract_class = true
	# self.abstract_class = true

  scope :not_deleted, where('deleted_at is null') 


  def self.sort_by_params(sort, bin)
  	column_names.include?(sort) ? sort : 
  										 bin.nil? ? "created_at" : 'deleted_at'
  end

end