class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :last_name
      t.integer :gender
      t.string :nationality
      t.date :birthday
      t.string :phone_number
      t.string :fav_movie
      t.string :fav_music_gender
      t.string :fav_pet
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
