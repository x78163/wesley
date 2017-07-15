class CreatePrayers < ActiveRecord::Migration[5.0]
  def change
    create_table :prayers do |t|
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
