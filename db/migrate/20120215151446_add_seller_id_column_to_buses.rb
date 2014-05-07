class AddSellerIdColumnToBuses < ActiveRecord::Migration
  def change
    add_column :buses, :seller_id, :integer
  end
end
