class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string  :title
      t.string  :city
      t.string  :package_type
      t.string  :banner
      t.text    :description
      t.string  :permalink
      t.timestamps null: false
    end
  end
end
