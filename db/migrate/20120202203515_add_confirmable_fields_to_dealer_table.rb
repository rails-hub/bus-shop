class AddConfirmableFieldsToDealerTable < ActiveRecord::Migration
  def change
    add_column :dealers, :confirmation_token, :string
    add_column :dealers, :confirmed_at, :datetime
    add_column :dealers, :confirmation_sent_at, :datetime    
  end
end
