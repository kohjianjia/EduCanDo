class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
    	t.references :user, foreign_key: true
    	t.string :category
    	t.string :description

    	t.timestamps
    end
  end
end
