class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.string :description
      t.integer :rating

      t.timestamps null: false
    end
  end
end
