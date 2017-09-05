class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string  :image
      t.string  :title
      t.text    :description
      t.integer :country_id
      t.integer :continent_id
      t.boolean :is_primary
      t.timestamps null: false
    end
  end
end
