class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string  :type
      t.string  :name
      t.text    :short_description
      t.text    :description
      t.date    :expired_date
      t.integer :duration
      t.string  :permalink
      t.integer :country_id
      t.integer :itinerary_id
      t.integer :tour_detail_id
      t.timestamps null: false
    end
  end
end
