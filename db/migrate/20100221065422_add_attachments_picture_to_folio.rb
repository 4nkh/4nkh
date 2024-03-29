class AddAttachmentsPictureToFolio < ActiveRecord::Migration[7.1]
  def self.up
    add_column :folios, :picture_file_name, :string
    add_column :folios, :picture_content_type, :string
    add_column :folios, :picture_file_size, :integer
    add_column :folios, :picture_updated_at, :datetime
  end

  def self.down
    remove_column :folios, :picture_file_name
    remove_column :folios, :picture_content_type
    remove_column :folios, :picture_file_size
    remove_column :folios, :picture_updated_at
  end
end
