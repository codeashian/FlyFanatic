class AddNewsToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :news, :boolean, default: false
  end
end
