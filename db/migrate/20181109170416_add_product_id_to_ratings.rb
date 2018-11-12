class AddProductIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :product_id, :integer
  end
end
