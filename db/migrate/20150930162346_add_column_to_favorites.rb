class AddColumnToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :spotify_id, :string
    add_column :favorites, :instagram_id, :string, default: 0
  end
end
