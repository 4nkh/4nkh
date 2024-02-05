class CreateUsers < ActiveRecord::Migration[7.1]
  def self.up
    create_table :users do |t|
      
      ## Database authenticatable
#      t.string :email,              null: false, default: ""
#      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
#      t.string   :reset_password_token
#      t.datetime :reset_password_sent_at

      ## Rememberable
#      t.datetime :remember_created_at
      
      
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
      #t.string :crypted_password
      t.string :password_digest
      t.string :password_confirmation
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

# frozen_string_literal: true

#class DeviseCreateUsers < ActiveRecord::Migration[7.0]
#  def change
#    create_table :users do |t|


      ## Database authenticatable
#      t.string :email,              null: false, default: ""
#      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
#      t.string   :reset_password_token
#      t.datetime :reset_password_sent_at

      ## Rememberable
#      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable
