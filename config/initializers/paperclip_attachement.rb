Paperclip.interpolates :content_type_extension do |attachment, style_name|
  case
    when ((style = attachment.styles[style_name]) && !style[:format].blank?) then style[:format]
    when attachment.instance.video? && style_name.to_s == 'transcoded' then 'flv'
    when attachment.instance.video? && style_name.to_s != 'original' then 'jpg'
  else
    File.extname(attachment.original_filename).gsub(/^\.+/, "")
  end
end

#Paperclip::Attachment.interpolations[:content_type_extension] = proc do |attachment, style_name|
#  case
#    when ((style = attachment.styles[style_name]) && !style[:format].blank?) then style[:format]
#    when attachment.instance.video? && style_name.to_s == 'transcoded' then 'flv'
#    when attachment.instance.video? && style_name.to_s != 'original' then 'jpg'
#  else
#    File.extname(attachment.original_filename).gsub(/^\.+/, "")
#  end
#end
#Paperclip::Attachment.default_options[:storage] = :fog
#Paperclip::Attachment.default_options[:storage] = :fog
#Paperclip::Attachment.default_options[:fog_credentials] = { provider: "Local", local_root: "#{Rails.root}/public"}
#Paperclip::Attachment.default_options[:fog_directory] = ""
#Paperclip::Attachment.default_options[:fog_host] = "http://localhost:3000"