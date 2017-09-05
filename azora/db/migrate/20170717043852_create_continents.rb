class CreateContinents < ActiveRecord::Migration
  def change
    create_table :continents do |t|
      t.string  :name
      t.string  :banner
      t.string  :permalink
      t.integer :sequence
      t.timestamps null: false
    end
  end
end
