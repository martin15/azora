class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string  :name
      t.string  :website
      t.string  :logo
      t.timestamps null: false
    end
  end
end
