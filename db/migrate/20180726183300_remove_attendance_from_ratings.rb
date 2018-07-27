class RemoveAttendanceFromRatings < ActiveRecord::Migration[5.2]
  def change
    remove_column :ratings, :attendance_id
  end
end