class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :user_id
      t.integer :skill_id

      t.timestamps null: false
    end

  # prevent users from recommending one skill more than once
  add_index :recommendations, [:user_id, :skill_id], unique: true
  end
end
