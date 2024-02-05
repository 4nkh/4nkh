class CreateContent < ActiveRecord::Migration[7.1]
  def self.up
    create_table :contents do |t|
      t.text :par1
      t.text :par2
      t.text :par3
      t.text :par4
      t.text :par5
      t.text :par6

      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end