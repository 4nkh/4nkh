class AddAttachmentsPictureToMovie < ActiveRecord::Migration[7.1]
  def self.up
    add_column :movies, :picture_file_name, :string
    add_column :movies, :picture_content_type, :string
    add_column :movies, :picture_file_size, :integer
    add_column :movies, :picture_updated_at, :datetime
  end

  def self.down
    remove_column :movies, :picture_file_name
    remove_column :movies, :picture_content_type
    remove_column :movies, :picture_file_size
    remove_column :movies, :picture_updated_at
  end
end
