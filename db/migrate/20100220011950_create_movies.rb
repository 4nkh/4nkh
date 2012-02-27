class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.references :user
      t.string :name
      t.text :description
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :movies
  end
end
