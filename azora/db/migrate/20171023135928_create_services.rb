class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string  :service_type
      t.string  :name
      t.text    :value
      t.string  :permalink
      t.timestamps null: false
    end
  end
end
