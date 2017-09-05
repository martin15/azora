class CreateTourItineraries < ActiveRecord::Migration
  def change
    create_table :tour_itineraries do |t|
      t.string  :day
      t.string  :title
      t.text    :description
      t.integer :tour_id
      t.timestamps null: false
    end
  end
end
