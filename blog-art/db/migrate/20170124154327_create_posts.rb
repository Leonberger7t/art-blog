class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.string :location
      t.string :exhibition

      t.timestamps
    end
  end
end
