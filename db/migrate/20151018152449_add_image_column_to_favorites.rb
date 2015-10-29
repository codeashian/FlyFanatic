class AddImageColumnToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :image, :string, default: ""
  end
end
