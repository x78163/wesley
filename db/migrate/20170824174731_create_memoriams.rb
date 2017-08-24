class CreateMemoriams < ActiveRecord::Migration[5.0]
  def change
    create_table :memoriams do |t|
      t.string :name
      t.string :commentor
      t.string :comment

      t.timestamps
    end
  end
end
