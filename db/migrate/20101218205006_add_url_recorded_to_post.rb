class AddUrlRecordedToPost < ActiveRecord::Migration[7.1]
  def self.up
    add_column :posts, :recorded_url, :string
  end

  def self.down
    remove_column :posts, :recorded_url
  end
end