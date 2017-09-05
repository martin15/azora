class CreateTourDetails < ActiveRecord::Migration
  def change
    create_table :tour_details do |t|
      t.date    :date_start
      t.date    :date_end
      t.integer :price
      t.text    :pricing_detail
      t.text    :note
      t.timestamps null: false
    end
  end
end
