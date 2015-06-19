class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact != nil
      flash.now[:notice] = 'Obrigado por entrar em contato.'
      ContactMailer.send_email(@contact).deliver
      ContactMailer.send_confirmation(@contact).deliver
    else
      flash.now[:notice] = 'Não foi possível entrar em contato. Tente novamente mais tarde.'
    end
  end
end