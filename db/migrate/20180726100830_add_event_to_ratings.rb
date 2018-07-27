class AddEventToRatings < ActiveRecord::Migration[5.2]
  def change
    add_reference :ratings, :event, foreign_key: true
  end
end
