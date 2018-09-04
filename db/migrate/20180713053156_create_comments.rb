class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.integer :idea_id
      t.integer :user_id
      t.text :text
      t.timestamps null: false
    end
    add_index :comments, [:user_id, :post_id]
    add_index :comments, [:user_id, :idea_id]
    add_index :comments, :post_id
    add_index :comments, :idea_id
  end
end
