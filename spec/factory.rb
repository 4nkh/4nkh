require 'factory_girl'

Factory.define :user do |u|
  u.name 'MBougie'
  u.email 'mathieub@4nkh.com'
  u.password 'password'
end

Factory.define :folio do |f|
  f.name 'folio'
  f.url 'http://www.google.com'
  f.description 'yahoo yahoo'
  f.picture_file_name 'roger'
  f.picture_content_type 'jpg'
end