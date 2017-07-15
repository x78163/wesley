class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :requestor
      t.string :recipient
      t.string :description
      t.integer :prayer
      t.date :when
      t.string :picture

      t.timestamps
    end
  end
end
