class CreatePosts < ActiveRecord::Migration[7.1]
  def self.up
    create_table :posts do |t|
      t.references :user
      t.string :tag_type
      t.string :url
      t.string :photo
      t.string :title
      t.text :body
      t.string :model
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
