class Post < ActiveRecord::Base
  include ThinkingSphinx::Scopes
  
  PER_PAGE = 10

  belongs_to :user, :counter_cache => true
  has_many :events
  
  acts_as_taggable_on :tags
  attr_readonly :posts_count, :as => :taggable
  
  scope :full, lambda { |f| {:full => f }}
  default_scope { order( 'created_at DESC' ) }

  accepts_nested_attributes_for :events
  
  self.per_page = 10
  
  TAG = %w{Visible Restricted}
  scope :by_user, lambda { |u|{ :conditions => ['user_id = ?',u.id]}}
  scope :by_tag, lambda { |tag| { :conditions => [ 'lower(tag_type) = ?',tag] } }  
  scope :by_model, lambda { |mod| { :conditions => [ 'lower(model) = ?',mod] } }
  scope :mod_posts, -> { where( :model => 'posts' ) }
  scope :starts_with, lambda { |letter| { :conditions => [ "upper(title) like ?",letter+"%"]} }
  scope :between, lambda { |starts,ends| { :conditions => ['created_at >= ? AND created_at <= ?',starts,ends] } }
  
  ThinkingSphinx::Index.define :post,  :with => :active_record do
    indexes title, :enable_star => 1
    indexes body, :min_infix_len => 3
    indexes url
    indexes model

    has tag_type, user_id, created_at, updated_at
  end
  #define_index do    
  #  indexes :title, :body, :url, :model, :tag_type
  #  has :tag_type
  #    set_property :enable_star => 1
  #    set_property :min_infix_len => 3
  #              
  #    has :user_id, :created_at,:updated_at       
  #end

  sphinx_scope(:by_state) { |sta| 
    { :conditions => { :tag_type => sta } }
  }  

  sphinx_scope(:by_kind) { |kin| 
    { :conditions => { :model => kin } }
  } 

  def can_edit?(user)
    return false if user.nil?
    admin_or_current_user?(user)
  end

  def can_delete?(user)
    return false if user.nil?
    admin_or_current_user?(user)
  end

  def to_param
    (title.nil? or title.blank?) ? "#{id}" : "#{id}-#{title.gsub(/^[a-z0-9]+/i,'-').downcase}"
  end

  def self.letter letter
    Post.find:all, :order => 'title ASC',
    :conditions => [ "upper(title) like ?", letter+'%' ]
  end
  
  def uniqueness_of_event(user, post)
    @event = Event.by_user(user).events_for_date_range(start_at: Date.today.to_time.utc, stop_at: Date.today.to_time.utc + 24.hours)
    @new_event = Event.create(:user_id => user, :post_id => post, :name => "X", :start_at => Time.now, :end_at => Time.now) if @event[0].nil?
  end
  
  def fetch_oembed_data(text)
    if text =~ /www.youtube.com/ #/src="http[s]?:\/\/www.youtube.com.*/ 
      oembed_url = "http://www.youtube.com/oembed?format=json&url=#{CGI.escape(url)}"
    elsif text =~  /vimeo.com/ #/src="http:\/\/player.vimeo.com.*/
      oembed_url = "http://vimeo.com/api/oembed.json?url=#{CGI.escape(url)}"
    else
      oembed_url = nil
    end  

    # Attempt to fetch OEmbed data from provider
    # If the URL is invalid, the provider will return a 404
    begin
      oembed_data = JSON.parse(Net::HTTP.get(URI(oembed_url)))
      #self.title = oembed_data['title']
      #self.description = oembed_data['description'] if oembed_data['description']
      #self.author = oembed_data['author_name']
      #self.author_url = oembed_data['author_url']
      #self.temporary_thumbnail_url = oembed_data['thumbnail_url']
      if oembed_data['video_id']
        @video_id = oembed_data['video_id'] 
      else
        ytrxp = /https?:\/\/((www.)?youtube.com\/(watch\?v=|embed\/|v\/)|youtu.be\/)(?<video_id>[\w-]*)/i
        @video_id = ytrxp.match(url)['video_id']
      end
      return "http://www.youtube.com/embed/#{@video_id}" if text =~ /www.youtube.com/
      return "http://player.video.com/video/#{@video_id}" if text =~ /vimeo.com/
    rescue Exception => e
      logger.warn "Error fetching OEmbed data for #{oembed_url}"
      raise e unless Rails.env == 'production'
      self.errors.add(:url, :invalid)
      return false
    end
  end
private
  def admin_or_current_user?(user)
    return true if user.is_admin or self.user_id == user.id
  end
end
# JSON Responses ------------------------------------------
# Vimeo
# {
#   "type":"video",
#   "version":"1.0",
#   "provider_name":"Vimeo",
#   "provider_url":"http:\/\/vimeo.com\/",
#   "title":"Brad!",
#   "author_name":"Casey Donahue",
#   "author_url":"http:\/\/vimeo.com\/caseydonahue",
#   "is_plus":"0",
#   "html":"<iframe src=\"http:\/\/player.vimeo.com\/video\/7100569\" width=\"1280\" height=\"720\" frameborder=\"0\" webkitAllowFullScreen mozallowfullscreen allowFullScreen><\/iframe>",
#   "width":1280,
#   "height":720,
#   "duration":118,
#   "description":"Brad finally gets the attention he deserves.",
#   "thumbnail_url":"http:\/\/b.vimeocdn.com\/ts\/294\/128\/29412830_1280.jpg",
#   "thumbnail_width":1280,
#   "thumbnail_height":720,
#   "video_id":7100569
# }
#
# YouTube
# {
#   "provider_url": "http:\/\/www.youtube.com\/",
#   "title": "Auto-Tune the News #8: dragons. geese. Michael Vick. (ft. T-Pain)",
#   "html": "\u003ciframe width=\"459\" height=\"344\" src=\"http:\/\/www.youtube.com\/embed\/bDOYN-6gdRE?fs=1\u0026feature=oembed\" frameborder=\"0\" allowfullscreen\u003e\u003c\/iframe\u003e",
#   "author_name": "schmoyoho",
#   "height": 344,
#   "thumbnail_width": 480,
#   "width": 459,
#   "version": "1.0",
#   "author_url": "http:\/\/www.youtube.com\/user\/schmoyoho",
#   "provider_name": "YouTube",
#   "thumbnail_url": "http:\/\/i3.ytimg.com\/vi\/bDOYN-6gdRE\/hqdefault.jpg",
#   "type": "video",
#   "thumbnail_height": 360
# }

# YouTube URL Types ---------------------------------------
# http://www.youtube.com/v/<video_id>
# http://youtu.be/<video_id>
# http://www.youtube.com/watch?v=<video_id>
# http://www.youtube.com/v/<video_id>