class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|

    	t.string :comment
    	t.references :user, foreign_key: true
    	t.references :attendance, foreign_key: true

    	t.timestamps
    	
    end
  end
end
