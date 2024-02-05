class AddPositionToUsers < ActiveRecord::Migration[7.1]
  def self.up
    add_column :users, :position, :integer
  end

  def self.down
    remove_column :users, :position
  end
end
