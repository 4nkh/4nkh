class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login
      t.string :phone
      t.string :location
      t.date :dob
      t.string :email
      t.string :tag_type
      t.text :par1
      t.text :par2
      t.text :par3
      t.text :par4
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.boolean :is_admin, :default => false
      t.integer :posts_count, :default => 0
      t.integer :movies_count, :default => 0   
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
