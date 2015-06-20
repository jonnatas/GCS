class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])

    if @contact
      flash.now[:notice] = "Obrigado por entrar em contato."
      ContactMailer.send_email(@contact).deliver
      ContactMailer.send_confirmation(@contact).deliver
    end

  end
end