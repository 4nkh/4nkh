class CreateEvent < ActiveRecord::Migration[7.1]
  def self.up
    create_table :events do |t|
      t.references :user
      t.references :post
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :all_day

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end