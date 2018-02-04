class AddDefaultNews < ActiveRecord::Migration
  def change
    add_column :news, :default, :boolean, default: false
  end
end
