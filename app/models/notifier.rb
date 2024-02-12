class Notifier < ActionMailer::Base
  default from: 'mathieub@4nkh.ca'
  
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

  def contact_email(support)
    #subject       email_params[:subject]
    #from          email_params[:name] + " <" + email_params[:address] + ">"
    #recipients    "mathieub@4nkh.com"
    #sent_on       Time.now
    #body          email_params[:body]
    # You only need to customize @recipients.
    
    #recipients "mathieub@4nkh.ca"
    #from       support.name + " <" + support.email + ">"
    #subject    support.subject
    #@support = support
    
    # @from = email_params[:name] + " <" + email_params[:address] + ">"
    #     @subject = email_params[:subject]
    #     @sent_on = Time.now
    #     @body = email_params[:body]
    #     @name = email_params[:name]
    #     @subject = email_params[:subject]
    #     @mail = email_params[:address]
    #content_type "text/html"
    #@support = support
    mail(to: 'admin@4nkh.ca', subject: support[:subject], from: support[:email]) do |format|
      format.text { render plain: support[:description].to_s }
      format.html { render html: "#{support[:description].to_s}".html_safe }
    end
    #mail(:to => "mathieub@4nkh.ca",
    #     :subject => "Welcome to My Awesome Site"),
         #:template_path => 'notifications',
         #:template_name => 'another')
         
  end
end
