require 'rspec'
require 'rails_helper'

describe Report do
	before :each do
		@rate = Rate.new(2008, 1, 1, "Total", "Total")
		@rate.request_rate_report
		@rate.request_analise_data
		@rate.generate_hash_result

	end

	describe "#initialize"
		it "Take the arguments and set to the instace variables" do
		 expect(@rate.instance_variable_get(:@year)).to eq(2008)
	              expect(@rate.instance_variable_get(:@grade_id)).to eq(1)
	              expect(@rate.instance_variable_get(:@state_id)).to eq(1)
	              expect(@rate.instance_variable_get(:@test_type)).to eq("Total")
	              expect(@rate.instance_variable_get(:@local)).to eq("Total")
		end

	describe "#final_year_avaiable"
		it "Find the last year available" do
			expect(@rate.instance_variable_get(:@final_year)).to eq(Rate.final_year_avaiable(2008,1,1))

		end

	describe "#request_rate"
	    it "Take de state, grade and year and return a Rate object from DB" do
	    	expect{
		local_rate = @rate.request_rate(2008,1,1,"Publica","Urbana")
	      	}.to raise_error(Error::NullElementAtDB)
	    end

	    describe "#request_distortion"
	    it "Take the year,state_id,grade_id,test_type,local and return the distortion object from DB" do
	    	expect{
		local_rate = @rate.request_rate(2008,1,1,"Publica","Urbana")
	      	}.to raise_error(Error::NullElementAtDB)
	    end

	describe "#request_rate_report"
		it "Request the rate report with the initial variable values" do
		  expect{
		  local_rate = @rate.request_rate(2008,10,1,"Publica","Urbana")
	      	  }.to raise_error(Error::NullElementAtDB)
		end

	describe "#request_average_to_evasion"
		it "Take de evasion reports and compute de average" do
			expect(@rate.instance_variable_get(:@evasion_average)).to eq(3.5833333333333335)
		end

	describe "#request_average_to_performance"
		it "Take de performance reports and compute de average" do
			expect(@rate.instance_variable_get(:@performance_average)).to eq(89.25)
		end

	describe "#request_average_to_distortion"
		it "Take de distortion reports and compute de average" do
			expect(@rate.instance_variable_get(:@distortion_average)).to eq(24.416666666666668)
		end

	describe "#request_standard_deviation_evasion"
		it "Take de evasion reports and compute de standard deviation" do
			expect(@rate.instance_variable_get(:@standard_deviation_evasion)).to eq(1.0930334954713063)
		end

	describe "#request_standard_deviation_performance"
		it "Take de performance reports and compute de standard deviation" do
			expect(@rate.instance_variable_get(:@standard_deviation_performance)).to eq(1.9636275953788493)
		end

	describe "#request_standard_deviation_distortion"
		it "Take de distortion reports and compute de standard deviation" do
			expect(@rate.instance_variable_get(:@standard_deviation_distortion)).to eq(9.070725194578191)
		end

	describe "#request_variance_evasion"
		it "Take de evasion reports and compute de varience" do
			expect(@rate.instance_variable_get(:@variance_evasion)).to eq(1.1947222222222225)
		end

	describe "#request_variance_performance"
		it "Take de performance reports and compute de varience" do
			expect(@rate.instance_variable_get(:@variance_performance)).to eq(3.8558333333333223)
		end

	describe "#request_variance_distortion"
		it "Take de distortion reports and compute de varience" do
			expect(@rate.instance_variable_get(:@variance_distortion)).to eq(82.27805555555555)
		end

	describe "#request_analise_data"
		it "Request analise data for all reports methods" do
			expect(@rate.instance_variable_get(:@evasion_average)).to eq(3.5833333333333335)
			expect(@rate.instance_variable_get(:@performance_average)).to eq(89.25)
			expect(@rate.instance_variable_get(:@distortion_average)).to eq(24.416666666666668)
			expect(@rate.instance_variable_get(:@standard_deviation_evasion)).to eq(1.0930334954713063)
			expect(@rate.instance_variable_get(:@standard_deviation_performance)).to eq(1.9636275953788493)
			expect(@rate.instance_variable_get(:@standard_deviation_distortion)).to eq(9.070725194578191)
			expect(@rate.instance_variable_get(:@variance_evasion)).to eq(1.1947222222222225)
			expect(@rate.instance_variable_get(:@variance_performance)).to eq(3.8558333333333223)
			expect(@rate.instance_variable_get(:@variance_distortion)).to eq(82.27805555555555)
		end

	describe "#generate_hash_result"
		it "Take the data result analise and create a hash for response result" do
			expected_hash_result = {:status=>"available",
				:evasion=>[3.9, 3.5, 5.7, 2.4, 2.5, 3.5],
				:performance=>[87.4, 91.6, 86.5, 89.3, 91.8, 88.9],
				:distortion=>[9.8, 29.7, 33.8, 14.2, 27.5, 31.5],
				:evasion_average=>3.5833333333333335,
				:performance_average=>89.25,
				:distortion_average=>24.416666666666668,
				:evasion_standard_deviation=>1.0930334954713063,
				:performance_standard_deviation=>1.9636275953788493,
				:distortion_standard_deviation=>9.070725194578191,
				:evasion_variance=>1.1947222222222225,
				:performance_variance=>3.8558333333333223,
				:distortion_variance=>82.27805555555555}

			expect(@rate.instance_variable_get(:@rate_hash)).to eq(expected_hash_result)
		end
end


