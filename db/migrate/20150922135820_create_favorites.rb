class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|

      t.timestamps null: false
      t.belongs_to :user, index: true
      t.string :name
    end
  end
end
