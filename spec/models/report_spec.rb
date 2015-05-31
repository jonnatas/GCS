require 'rspec'
require 'rails_helper'

describe Report do

 before :each do
 	@report = Report.new(2011,"1° ano", "AC", "Total", "Total")
 end 

describe "#initialize"
  it "take the params and set them to the object" do
     expect(@report.instance_variable_get(:@year)).to eq(2011)
     expect(@report.instance_variable_get(:@grade_id)).to eq(1)
     expect(@report.instance_variable_get(:@state_id)).to eq(1)
     expect(@report.instance_variable_get(:@test_type)).to eq("Total")
     expect(@report.instance_variable_get(:@local)).to eq("Total")
  end

describe "#request_report" 
	it "create prova_brasil and rate object and reporturn a hash with this objects and year" do
		@report.request_report
		expect(@report.report_result_hash).not_to eq(nil)
	end  





end