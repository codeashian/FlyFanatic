class AddDetailsToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :spotify_url, :string
    add_column :playlists, :favorite_id, :integer
  end
end
