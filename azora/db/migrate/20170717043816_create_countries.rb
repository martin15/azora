class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string  :name
      t.string  :banner
      t.boolean :free_visa, :default => 0
      t.integer :free_visa_duration, :default => 0
      t.boolean :visa_on_arrival, :default => 0
      t.integer :voa_duration, :default => 0
      t.text    :visa_requirement
      t.string  :permalink
      t.integer :continent_id
      t.timestamps null: false
    end
  end
end
