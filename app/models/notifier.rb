class Notifier < ActionMailer::Base
  
   #this is the method that actually sends the email
  #def multipart_alternative(email_params)

    #@from = email_params["from_email"]
    #@recipients = "gunz0@hotmail.com"
    #@subject = email_params["the_subject"]
    #@mail_info = email_params
    #@body["email_params"] = email_params
    #@sent_on = Time.now
   
#part :content_type => "text/plain",
#:body => render_message("multipart_alternative_plain", "email_params" => email_params)

#part :content_type => "text/html",
#:body => render_message("multipart_alternative", "email_params" => email_params)   

#end

  def contact_email(email_params)
    # You only need to customize @recipients.
    @recipients = "admin@4nkh.com"
    @from = email_params[:name] + " <" + email_params[:address] + ">"
    @subject = email_params[:subject]
    @sent_on = Time.now
    @body["email_body"] = email_params[:body]
    @body["email_name"] = email_params[:name]
    @body["email_subject"] = email_params[:subject]
    @body["email_address"] = email_params[:address]
    content_type "text/html"
  end
end
