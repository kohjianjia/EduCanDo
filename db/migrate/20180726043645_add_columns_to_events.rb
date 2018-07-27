class AddColumnsToEvents < ActiveRecord::Migration[5.2]
  def change

  	add_column :events, :title, :string
  	add_column :events, :venue, :string
  	add_column :events, :event_date, :date
  	add_column :events, :start_time, :string
  	add_column :events, :end_time, :string

  end
end
