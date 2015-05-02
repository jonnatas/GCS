require 'rspec'
require_relative'../app/models/report'

describe Report do

 before :each do
 	@report = Report.new(2011,1,"AC")
 end 

describe "#initialize"
  it "take the params and set them to the object" do
     expect(@report.instance_variable_get(:@year)).to eq(2011)
     expect(@report.instance_variable_get(:@id_grade)).to eq(1)
     expect(@report.instance_variable_get(:@id_state)).to eq(1)
  end




end