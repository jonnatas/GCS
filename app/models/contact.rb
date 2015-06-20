require 'open-uri'

class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :subject , :validade => false

 def internet_connection?
    begin
      true if open("http://www.google.com/")
    rescue
      false
    end
 end

end