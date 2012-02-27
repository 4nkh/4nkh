class AddPositionToFolios < ActiveRecord::Migration
  def self.up
    add_column :folios, :position, :integer
  end

  def self.down
    remove_column :folios, :position
  end
end
