class AddUserIdToPrayers < ActiveRecord::Migration[5.0]
  def change
    add_column :prayers, :user_id, :integer
  end
end
