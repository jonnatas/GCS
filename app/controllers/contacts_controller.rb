class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
      ContactMailer.send_email(@contact).deliver
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end