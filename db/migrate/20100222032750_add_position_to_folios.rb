class AddPositionToFolios < ActiveRecord::Migration[7.1]
  def self.up
    add_column :folios, :position, :integer
  end

  def self.down
    remove_column :folios, :position
  end
end
