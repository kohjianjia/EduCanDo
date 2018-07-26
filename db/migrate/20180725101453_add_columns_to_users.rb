class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change

  	add_column :users, :point, :integer, default: 0
  	add_column :users, :level, :string, default: "plastic"

  end
end
