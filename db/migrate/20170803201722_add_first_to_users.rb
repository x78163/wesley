class AddFirstToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first, :string
  end
end
