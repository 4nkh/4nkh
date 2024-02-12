class NotifierMailer < ApplicationMailer
  def new_account(recipient)
    #attachments['attachment.pdf'] = File.read("public/file.pdf")
    
    mail(
    to: recipient,
    subject: "new account"
    #content_type: "text/html",
    #body: "<html><strong>Help There</strong></html>"
    )
  end
end
