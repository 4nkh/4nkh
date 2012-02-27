class Movie < ActiveRecord::Base
  PER_PAGE = 20
  belongs_to :user
 
  has_attached_file :picture,
                    :styles => {:original => '200x200'},
                    :url => '/:class/:id/:style.:extension',
                    :default_url => '/movies/:id/default.jpg'
                      
  validates_presence_of :picture
  
  has_attached_file :flv,
		    :styles => {:default => '200x200'},
                    :url => '/:class/:id/:style.:content_type_extension',
                    :path => ':rails_root/public/movies/:id/:style.:content_type_extension',
                    :processors => lambda { |a| a.video? ? [ :video_thumbnail ] : [ :thumbnail ] },
                    :default_url => '/movies/:id/default.jpg'
                    
  validates_presence_of :name, :flv
  validates_uniqueness_of :name

  validates_attachment_presence :flv
  
  validates_attachment_content_type :flv, :content_type => [ 'application/flv','application/x-flv','video/flv','video/x-flv','application/x-flash-video', 'application/mov' ]
  validates_attachment_size :flv, :less_than => 1000.megabytes 
  
  validates_length_of :description , :within => 0..500, :allow_blank => true, :message => 'Your description length cant exeed 500 characters.'
           
  default_scope :order => 'position ASC'
  scope :starts_with, lambda { |letter| { :conditions => [ "title like ?",letter + "*"]} }
  scope :by_position, lambda { |p| { :conditions => [ "position = ?", p.id ] }}


  define_index do    
    indexes :name, :description
        set_property :enable_star => 1
        set_property :min_infix_len => 3
                
        has :user_id, :created_at,:updated_at       
  end

  def video?
    [ 'application/flv','application/x-flv','video/flv','video/x-flv','application/x-flash-video', 'application/mov' ].include?(flv.content_type)
  end
#  acts_as_state_machine :initial => :pending
#  state :pending
#  state :converting
#  state :converted, :enter => :set_new_filename
#  state :error

#  event :convert do
#    transitions :from => :pending, :to => :converting
#  end

#  event :converted do
#    transitions :from => :converting, :to => :converted
#  end

#  event :failed do
#    transitions :from => :converting, :to => :error
#  end
 
#  def convert
#    self.convert!

#    success = system(convert_command)
#    logger.debug 'Converting File: ' + success.to_s + ' Exit status ' + $?.exitstatus.to_s

#    if success && $?.exitstatus == 0
#     logger.debug('converted')
#     self.converted!
#    else
#     self.failed!
#    end
#  end
  def self.letter letter
    Movie.find:all, :order => 'name ASC',    
    :conditions => [ "upper(name) like ?", letter+'%' ]
  end

  
  def swfupload_file=(data)
    self.name = data.original_filename.to_s
    data.content_type = MIME::Types.type_for(data.original_filename).to_s
    self.flv = data
    
  end

#private
#  def convert_command
 #  output = File.join(File.dirname(source.path),"original.mp4")

#   File.open(output,"w")

#   command = <<-end_command
#     ffmpeg -i #{source.path} -vcodec libx264 -crf 25 -g 250 -r 20 -s 1280x720 -bf #3 -b_strategy 1 -coder 1 -qmin 10 -qmax 51 -sc_threshold 40 -flags +loop -cmp +chroma -me_range 16 -me_method hex -subq 5 -i_qfactor 0.71 -qcomp 0.6 -qdiff 4 -directpred 1 -flags2 +fastpskip -dts_delta_threshold 1 -acodec libfaac -ab 96 #{output}
#    end_command

#   logger.debug('convert command' + command.to_s)
#   command.gsub!(/\s+/," ")
#  end

 def extract_frames
 command = <<-end_command
    ffmpeg -itsoffset -4 -i #{source.path} -y -vcodec mjpeg -vframes 1 -an -f rawvideo -s 200x200 output%2d.jpg
    end_command
 end

#  def set_new_filename
#    logger.debug('set new filename')
#    update_attribute(:source_file_name,"original.flv")
#  end

end
