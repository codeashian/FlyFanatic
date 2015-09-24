class AddColumnsToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :artist, :string
  end
end
