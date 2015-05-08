require 'rspec'
require_relative'../app/models/ideb'

describe Report do

 before :each do
 	@ideb = Ideb.new(2011,"AC",1)
 end 

describe "#initialize"
  it "take the params and set them to the object" do
     expect(@ideb.instance_variable_get(:@year)).to eq(2011)
     expect(@ideb.instance_variable_get(:@uf)).to eq("AC")
     expect(@ideb.instance_variable_get(:@grade)).to eq(1)
  end


end