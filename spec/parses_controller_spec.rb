require 'rspec'
require_relative '../app/controllers/parses_controller'

describe ParsesController do

  before :each do
    @parses = Parse.all
  end

  describe "#index"
  it "take the params and set them to the object" do
     	expect(@parses).not_to be_nil
  end

  describe "#new"
    it "Should set parses as a object Parse" do
    	expect(@parses).to be_an_instance_of(Parse)
    end


end