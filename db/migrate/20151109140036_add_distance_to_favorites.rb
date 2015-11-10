class AddDistanceToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :distance, :integer, default: 30
  end
end
