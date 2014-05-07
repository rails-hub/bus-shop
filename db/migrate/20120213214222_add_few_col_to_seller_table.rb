class AddFewColToSellerTable < ActiveRecord::Migration
  def change
		add_column :sellers, :address, :string
		add_column :sellers, :province, :string
		add_column :sellers, :city, :string
		add_column :sellers, :company_name, :string
		add_column :sellers, :country, :string
  end
end
