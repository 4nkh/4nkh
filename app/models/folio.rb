class Folio < ActiveRecord::Base
  PER_PAGE = 20
  belongs_to :user
 
  has_attached_file :picture,
                    :styles => {:thumb => "200x200",:original => "800x800>" },
                    :url => '/:class/:id/:style.:extension',
                    :default_url => '/images/no-avatar.jpg'
                      
  validates_presence_of :picture
  
                    
  validates_presence_of :name
  validates_uniqueness_of :name
  
           
  default_scope :order => 'position ASC'
  scope :starts_with, lambda { |letter| { :conditions => [ "title like ?",letter + "*"]} }
  scope :by_position, lambda { |p| { :conditions => [ "position = ?", p.id ] }}


  define_index do    
    indexes :name, :url, :description
        set_property :enable_star => 1
        set_property :min_infix_len => 3
                
        has :user_id, :created_at,:updated_at       
  end


  def self.letter letter
    Folio.find:all, :order => 'name ASC',    
    :conditions => [ "upper(name) like ?", letter+'%' ]
  end
  

end
