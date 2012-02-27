module UsersHelper
 def validate_demo
   validates_presence_of :demo
  
   validates_attachment_content_type :demo, :content_type => [ 'application/flv','application/x-flv','video/flv','video/x-flv','application/x-flash-video' ]
   validates_attachment_size :demo, :less_than => 30.megabytes
  end
end
