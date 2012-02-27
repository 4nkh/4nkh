# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)announce = Forum.create(:name => "Announcement", :description => "Announcements, news and other related bits.")
#require 'faker'

admin = User.create(:login => "admin",:email => "admin@4nkh.com",:password => "odie1st", :password_confirmation => "odie1st", :is_admin => true)
admin = User.create(:login => "MBougie",:email => "mathieub@4nkh.com",:password => "odie1st", :password_confirmation => "odie1st", :is_admin => true)
user = User.create(:login => "DFabien",:email => "denis@artfox.com",:password => "123denis123", :password_confirmation => "123denis123", :is_admin => false)
user = User.create(:login => "EMillette",:email => "eric_millette@mamixa.com",:password => "123eric123", :password_confirmation => "123eric123", :is_admin => false)
user = User.create(:login => "MCote",:email => "melanie_cote@4nkh.com",:password => "123mela123", :password_confirmation => "123mela123", :is_admin => false)
user = User.create(:login => "MDuval",:email => "billing@4nkh.com",:password => "123merc123", :password_confirmation => "123merc123", :is_admin => false)
user = User.create(:login => "JValrant",:email => "jonathan_valgrant@4nkh.com",:password => "123jona123", :password_confirmation => "123jona123", :is_admin => false)
user = User.create(:login => "Slabonte",:email => "sebasien_labonte@4nkh.com",:password => "123seba123", :password_confirmation => "123seba123", :is_admin => false)
user = User.create(:login => "DSmith",:email => "david_smith@4nkh.com",:password => "123davi123", :password_confirmation => "123davi123", :is_admin => false)
user = User.create(:login => "Jremero",:email => "john_romero@4nkh.com",:password => "123john123", :password_confirmation => "123john123", :is_admin => false)
user = User.create(:login => "CCasgrain",:email => "catherine_casgrain@4nkh.com",:password => "123cath123", :password_confirmation => "123cath123", :is_admin => false)
user = User.create(:login => "MDecaroufel",:email => "martin_decaroufel@4nkh.com",:password => "123mart123", :password_confirmation => "123mart123", :is_admin => false)
user = User.create(:login => "JPDeblois",:email => "jp_debloisl@4nkh.com",:password => "123jean123", :password_confirmation => "123jean123", :is_admin => false)

#500.times do |i|
 # puts "Start Create user #{i}"
 # user = User.create({:email => Faker::Internet.email,:password => 'test',:password_confirmation => 'test'})
#  user = User.create({:login => Faker::Internet.user_name, :id => user.id})
#  user.save
#end

