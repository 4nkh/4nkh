class Support < ActiveRecord::Base
  validates_presence_of :email, :name, :subject, :description
  validate :validate_email
  after_save :send_mail
  
  def validate_email
    unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
       self.errors.add(:email, "is not valid")
    end  
  end
  
  def send_mail
    Notifier.contact_email(self).deliver
  end
end  