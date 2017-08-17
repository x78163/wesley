class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :eventstart
      t.string :poc
      t.string :phone
      t.string :location
      t.string :description
      t.datetime :eventend
      t.string :email

      t.timestamps
    end
  end
end
