class AddCountFieldsToTag < ActiveRecord::Migration[7.1]
  def self.up
    [:tags].each do |tbl|
      add_column tbl, :posts_count, :integer, :default => 0 
    end
  end 
  def self.down
    [:tags].each do |tbl|
      remove_column tbl, :posts_count
    end
  end  
end
