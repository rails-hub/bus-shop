class ManageViews < ActiveRecord::Base
  def get_active_columns
    self.attributes.each.select { |m| m if m[1] == true}.count
  end
end
