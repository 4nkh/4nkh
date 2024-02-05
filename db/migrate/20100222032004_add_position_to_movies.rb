class AddPositionToMovies < ActiveRecord::Migration[7.1]
  def self.up
    add_column :movies, :position, :integer
  end

  def self.down
    remove_column :movies, :position
  end
end
