class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.integer :user_id
      t.text :description 
      t.timestamps null:false
    end
    add_index :ideas, :user_id
  end
end
