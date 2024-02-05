class AddExtraFieldsToMovies < ActiveRecord::Migration[7.1]
  def self.up
    add_column :movies, :duration, :integer, :default => 0
    add_column :movies, :resolution, :string, :default => nil
  end

  def self.down
    [:duration,:resolution].each do |c|
      remove_column :movies, c
    end
  end
end
