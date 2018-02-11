class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string  :name
      t.string  :website
      t.string  :logo
      t.timestamps null: false
    end
  end
end
