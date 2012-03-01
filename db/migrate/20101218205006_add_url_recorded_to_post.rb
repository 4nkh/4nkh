class AddUrlRecordedToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :recorded_url, :string
  end

  def self.down
    remove_column :posts, :recorded_url
  end
end