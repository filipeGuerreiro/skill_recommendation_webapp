class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.integer :user_id
      t.string :name
	  t.integer :recommendations, :default => 0

      t.timestamps null: false
    end
	
  add_index :skills, :name
  
  # for orderby descending in user page
  add_index :skills, :recommendations
  
  # prevent users from adding same skill twice
  add_index :skills, [:user_id, :name], unique: true
  end
end
