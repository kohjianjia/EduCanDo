class AddColumnToAttendances < ActiveRecord::Migration[5.2]
  def change

  	add_column :attendances, :egg, :boolean, default: false
  	
  end
end
