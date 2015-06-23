class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def sent
  end

  def create
    @contact = Contact.new(params[:contact])

    if @contact
      render :sent
      ContactMailer.send_email(@contact).deliver
      ContactMailer.send_confirmation(@contact).deliver
    end
  end
end