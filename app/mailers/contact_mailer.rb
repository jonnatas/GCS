class ContactMailer < ActionMailer::Base
  default from: "contatoenturma@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.send_email.subject
  #
  def send_email(contact)
    @name = contact.name
    @email = contact.email
    @message = contact.message
    @subject = contact.subject
    mail to: "contatoenturma@gmail.com" , subject: @subject
  end

  def send_confirmation(contact)
    @email =  contact.email
    @name  = contact.name

    mail to: @email , subject: "Recebemos seu email"
  end
end
