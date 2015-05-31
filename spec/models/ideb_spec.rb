require 'rspec'
require 'rails_helper'

describe Ideb do

 before :each do
 	@ideb = Ideb.new(2011,1,1)
 end 

describe "#initialize"
  it "take the params and set them to the object" do
     expect(@ideb.instance_variable_get(:@year)).to eq(2011)
     expect(@ideb.instance_variable_get(:@state_id)).to eq(1)
     expect(@ideb.instance_variable_get(:@grade_id)).to eq(1)
  end


end