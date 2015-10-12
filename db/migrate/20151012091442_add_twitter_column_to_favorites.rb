class AddTwitterColumnToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :twitter_user, :string, default: ""
  end
end
