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
		expect(@ideb.instance_variable_get(:@ideb_result)).to eq([])
		expect(@ideb.instance_variable_get(:@years)).to eq([])
		expect(@ideb.instance_variable_get(:@grade_ids)).to eq([])
  end

describe "#generate_hash_result"
  it "should compute variance to given ideb" do

  	expected_hash = {:status=>"available", :ideb=>[4.6], :ideb_average=>4.6, :ideb_standard_deviation=>0.0, 
  		:ideb_variance=>0.0, :ideb_years=>["2011"], :ideb_grade_ids=>["1"]}

  	@ideb.request_ideb_report
  	expect(@ideb.instance_variable_get(:@ideb_hash)).to eq(expected_hash)
  	
  	#by testing this method, we make sure that the requested methods are also working
  end
end