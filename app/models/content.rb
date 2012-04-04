class Content < ActiveRecord::Base
  validates_length_of :par1, :within => 0..800, :allow_blank => true, :message => "your text's either too short or too long"
  validates_length_of :par2, :within => 0..800, :allow_blank => true, :message => "your text's either too short or too long"
  validates_length_of :par3, :within => 0..800, :allow_blank => true, :message => "your text's either too short or too long"
  validates_length_of :par4, :within => 0..800, :allow_blank => true, :message => "your text's either too short or too long"
  validates_length_of :par5, :within => 0..800, :allow_blank => true, :message => "your text's either too short or too long"
  validates_length_of :par6, :within => 0..800, :allow_blank => true, :message => "your text's either too short or too long"
end