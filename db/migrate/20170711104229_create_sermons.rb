class CreateSermons < ActiveRecord::Migration[5.0]
  def change
    create_table :sermons do |t|
      t.string :title
      t.string :speaker
      t.date :speakdate
      t.string :photo
      t.string :audio
      t.string :description

      t.timestamps
    end
  end
end
