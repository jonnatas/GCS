require 'rspec'
require_relative'../app/models/rate'

describe Report do
	before :each do
		@rate = Rate.new(2005,1,1)
		@rate.request_rate_report
	end

	describe "#initialize"
		it "Take the arguments and set to the instace variables" do
		 expect(@rate.instance_variable_get(:@year)).to eq(2005)
	     expect(@rate.instance_variable_get(:@id_grade)).to eq(1)
	     expect(@rate.instance_variable_get(:@id_state)).to eq(1)
		end

	describe "#final_year_avaiable"
		it "Find the last year available" do
			expect(@rate.instance_variable_get(:@final_year)).to eq("2012")
		end

	describe "#request_rate"
	    it "Take de state, grade and year and return a Rate object from DB" do
	      new_rate = @rate.request_rate(2005,1,1)
	      expect(new_rate.id).to eq(1)
	      expect(new_rate.evasion).to eq(15)
	      expect(new_rate.performance).to eq(10)
	      expect(new_rate.distortion).to eq(13)
	      expect(new_rate.id_grade).to eq(1)
	      expect(new_rate.year).to eq(2005)
	      expect(new_rate.id_state).to eq(1)
	    end

	describe "#request_rate_report"
		it "Request the rate report with the initial variable values" do
			expect(@rate.instance_variable_get(:@evasion_result)).to eq([15.0,10.0,12.0,15.0,10.0,12.0,15.0,10.0])
			expect(@rate.instance_variable_get(:@performance_result)).to eq([10.0,9.0,8.0,10.0,9.0,8.0,10.0,9.0])
			expect(@rate.instance_variable_get(:@distortion_result)).to eq([13.0,13.0,13.0,13.0,13.0,13.0,13.0,13.0])
		end

	describe "#request_average_to_evasion"
		it "Take de evasion reports and compute de average" do
			expect(@rate.instance_variable_get(:@evasion_average)).to eq(12.375)
		end

	describe "#request_average_to_performance"
		it "Take de performance reports and compute de average" do
			expect(@rate.instance_variable_get(:@performance_average)).to eq(9.125)
		end

	describe "#request_average_to_distortion"
		it "Take de distortion reports and compute de average" do
			expect(@rate.instance_variable_get(:@distortion_average)).to eq(13.0)
		end

	describe "#request_standard_deviation_evasion"
		it "Take de evasion reports and compute de standard deviation" do
			expect(@rate.instance_variable_get(:@standard_deviation_evasion)).to eq(2.1758618981911515)
		end

	describe "#request_standard_deviation_performance"
		it "Take de performance reports and compute de standard deviation" do
			expect(@rate.instance_variable_get(:@standard_deviation_performance)).to eq(0.7806247497997998)
		end

	describe "#request_standard_deviation_distortion"
		it "Take de distortion reports and compute de standard deviation" do
			expect(@rate.instance_variable_get(:@standard_deviation_distortion)).to eq(0.0)
		end

	describe "#request_variance_evasion"
		it "Take de evasion reports and compute de varience" do
			expect(@rate.instance_variable_get(:@variance_evasion)).to eq(4.734375)
		end

	describe "#request_variance_performance"
		it "Take de performance reports and compute de varience" do
			expect(@rate.instance_variable_get(:@variance_performance)).to eq(0.609375)
		end

	describe "#request_variance_distortion"
		it "Take de distortion reports and compute de varience" do
			expect(@rate.instance_variable_get(:@variance_distortion)).to eq(0.0)
		end

	describe "#request_analise_data"
		it "Request analise data for all reports methods" do
			expect(@rate.instance_variable_get(:@evasion_average)).to eq(12.375)
			expect(@rate.instance_variable_get(:@performance_average)).to eq(9.125)
			expect(@rate.instance_variable_get(:@distortion_average)).to eq(13.0)
			expect(@rate.instance_variable_get(:@standard_deviation_evasion)).to eq(2.1758618981911515)
			expect(@rate.instance_variable_get(:@standard_deviation_performance)).to eq(0.7806247497997998)
			expect(@rate.instance_variable_get(:@standard_deviation_distortion)).to eq(0.0)
			expect(@rate.instance_variable_get(:@variance_evasion)).to eq(4.734375)
			expect(@rate.instance_variable_get(:@variance_performance)).to eq(0.609375)
			expect(@rate.instance_variable_get(:@variance_distortion)).to eq(0.0)
		end

	describe "#generate_hash_result"
		it "Take the data result analise and create a hash for response result" do
			expected_hash_result = {:evasion=>[15.0, 10.0, 12.0, 15.0, 10.0, 12.0, 15.0, 10.0],
			 :performance=>[10.0, 9.0, 8.0, 10.0, 9.0, 8.0, 10.0, 9.0],
			  :distortion=>[13.0, 13.0, 13.0, 13.0, 13.0, 13.0, 13.0, 13.0],
			   :evasion_average=>12.375, :performance_average=>9.125,
			    :distortion_average=>13.0, :evasion_standard_deviation=>2.1758618981911515,
			     :performance_standard_deviation=>0.7806247497997998, :distortion_standard_deviation=>0.0,
			      :evasion_variance=>4.734375, :performance_variance=>0.609375, :distortion_variance=>0.0}

			expect(@rate.instance_variable_get(:@rate_hash)).to eq(expected_hash_result)
		end

  
end