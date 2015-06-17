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

			expected_hash = {:ideb=>{:status=>"available", :ideb=>[4.6], :ideb_average=>4.6,
			 :ideb_standard_deviation=>0.0, :ideb_variance=>0.0, :ideb_years=>["2011"], :ideb_grade_ids=>["1"]}, 
			 :rates=>{:status=>"available", :evasion=>[3.2, 3.0, 1.9], :performance=>[95.4, 79.5, 88.3], 
			 	:distortion=>[29.5, 27.8, 29.8], :evasion_average=>2.6999999999999997, 
			 	:performance_average=>87.73333333333333, :distortion_average=>29.03333333333333,
			 	 :evasion_standard_deviation=>0.5715476066494083, :performance_standard_deviation=>6.503503329402975,
			 	  :distortion_standard_deviation=>0.8806563209081937, :evasion_variance=>0.32666666666666677, 
			 	  :performance_variance=>42.29555555555559, :distortion_variance=>0.7755555555555554}, :year=>2011, :grade=>1}


			expect(@report.instance_variable_get(:@report_result_hash)).to eq(expected_hash)

		end
end

