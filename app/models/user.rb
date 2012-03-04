class User < ActiveRecord::Base
  acts_as_authentic 
  acts_as_taggable_on :tags

  has_many :folios, :dependent => :destroy  
  has_many :movies, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_many :links, :dependent => :destroy
  has_many :images, :dependent => :destroy
  has_many :videos, :dependent => :destroy
  has_many :textos, :dependent => :destroy
  has_many :events

  accepts_nested_attributes_for :events

  has_attached_file :photo, 
                    :styles => {:thumb => "75x75#",:original => "200x200#" },
                    :url => "/user/:id/:style.:extension",
                    :default_url => '/assets/no-avatar.jpg'
    
  validates_presence_of :photo
  
  validates_attachment_content_type :photo, :content_type => [ 'application/jpg','application/x-jpg','application/png','application/x-png','application/jpeg','application/x-jpeg','application/bmp','application/x-bmp','image/jpg', 'image/jpeg','image/png','image/bmp' ] 
 
  has_attached_file :demo,
                    :url => '/user/:id/:style.:extension',
                    :default_url => '/movie/original.flv'
 
  validates_presence_of :demo
  
  validates_attachment_content_type :demo, :content_type => [ 'application/flv','application/x-flv','video/flv','video/x-flv','application/x-flash-video' ]
  validates_attachment_size :demo, :less_than => 30.megabytes
  validates_length_of :login, :within => 1..20, :message => "login either too short or too long"           
TAG = %w{Consultant Developer Designer Translator Technician Accounting Integrator Dba}  
ADMIN = %w{Ceo Developer}

  validates_length_of :par1, :within => 0..500, :allow_blank => true, :message => "your text's either too short or too long"
  validates_length_of :par2, :within => 0..500, :allow_blank => true, :message => "your text's either too short or too long"
  validates_length_of :par3, :within => 0..500, :allow_blank => true, :message => "your text's either too short or too long"
  validates_length_of :par4, :within => 0..500, :allow_blank => true, :message => "your text's either too short or too long"

  default_scope :order => 'position ASC'
  scope :by_position, lambda { |p| { :conditions => [ "position = ?", p.id ] }}
  scope :active, :conditions => ['active = true']
  scope :limit, lambda { |num| {:limit => num } }
  scope :between, lambda { |starts,ends| {:conditions => [ 'created_at >= ? AND created_at <= ?',starts,ends] } }
  scope :by_tag, lambda{ |tag| { :conditions => [ 'lower(tag_type) = ?',tag] } }
   
  define_index do     
    indexes :login, :tag_type
        set_property :enable_star => 1
        set_property :min_infix_len => 3
        
        has :id, :created_at,:updated_at        
  end

  def self.letter letter
    User.find:all, :order => 'login ASC',    
    :conditions => [ "upper(login) like ?", letter+'%' ]
  end

  def can_edit?(user)
    return true if id == user.id || user.is_admin
  end
 
end
