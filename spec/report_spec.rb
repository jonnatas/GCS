require 'rspec'
require_relative'../app/models/report'

describe Report do

 before :each do
 	@report = Report.new(2011,1,"AC")
 end 

 describe Report::Error::NoDataToSelectedYear do
		before :each do
			@error = Report::Error::NoDataToSelectedYear.new
		end
		describe "#message"
			  	it "Show the message" do 
			  		expect(@error.message).to eq("Sorry, but there is no record on DB for this year.")
			  		end
	end

describe "#initialize"
  it "take the params and set them to the object" do
     expect(@report.instance_variable_get(:@year)).to eq(2011)
     expect(@report.instance_variable_get(:@grade_id)).to eq(1)
     expect(@report.instance_variable_get(:@state_id)).to eq(1)
  end

describe "#request_report" 
	it "create prova_brasil and rate object and reporturn a hash with this objects and year" do
		@report.request_report
		expect(@report.report_result_hash).not_to eq(nil)
	end  





end