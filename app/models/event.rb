class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  #has_event_calendar
  
  scope :by_user, lambda{ |usr|{ :conditions => ["user_id = ?",usr]}}
  scope :by_post, lambda{ |pos|{ :conditions => ["post_id = ?",pos]}}
end
