require 'rspec'
require 'rails_helper'

describe ContactsController, :type =>:request do

            


    describe "GET #new"
    it "create a new contact and return success" do
      get "contacts/new"
      expect(response).to render_template("new")
    end

    describe "GET #create"
    it "should render the page and send the email" do
        get "contacts/create"
        expect(flash.now[:notice]).to eq("Obrigado por entrar em contato.")
    end



end