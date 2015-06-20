require 'rspec'
require 'rails_helper'

describe ContactMailer do

	describe "#send_email"
		it "take the params and send the email as a class method" do
		 @contact = Contact.new({:name => "Cara", :email =>"zeca@unb.br", :message => "Je me"})
		 expect(@contact).not_to eq(nil)
		end

end