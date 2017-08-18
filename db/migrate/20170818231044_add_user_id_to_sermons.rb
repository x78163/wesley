class AddUserIdToSermons < ActiveRecord::Migration[5.0]
  def change
    remove_column :sermons, :user_id
    add_column :sermons, :user_id, :integer
  end
end
