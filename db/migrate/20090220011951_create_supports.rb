class CreateSupports < ActiveRecord::Migration
  def self.up
    create_table :supports do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :description
      t.boolean :api, :default => 0
      t.boolean :seo, :default => 0
      t.boolean :website, :default => 0
      t.boolean :mobile, :default => 0
      t.boolean :games, :default => 0
      t.boolean :hosting, :default => 0
      t.boolean :design, :default => 0
      t.boolean :consulting, :default => 0
      t.boolean :job, :default => 0
      t.boolean :other, :default => 0
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :supports
  end
end
