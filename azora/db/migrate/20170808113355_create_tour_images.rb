class CreateTourImages < ActiveRecord::Migration
  def change
    create_table :tour_images do |t|
      t.string  :image
      t.integer :tour_id
      t.boolean :is_primary
      t.timestamps null: false
    end
  end
end
