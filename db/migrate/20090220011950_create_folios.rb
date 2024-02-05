class CreateFolios < ActiveRecord::Migration[7.1]
  def self.up
    create_table :folios do |t|
      t.references :user
      t.string :name
      t.text :description
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :folios
  end
end
