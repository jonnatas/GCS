require 'rspec'
require_relative'../app/models/rate'

describe Report do
	before :each do
		@rate = Rate.new(2005,1,1)
	end

	describe "#initialize"
		it "Take the arguments and set to the instace variables" do
		 expect(@rate.instance_variable_get(:@year)).to eq(2005)
	     expect(@rate.instance_variable_get(:@id_grade)).to eq(1)
	     expect(@rate.instance_variable_get(:@id_state)).to eq(1)
		end

	describe "#final_year_avaiable"
		it "Find the last year available" do
			expect(@rate.instance_variable_get(:@final_year)).to eq("2007")
		end

	describe "#compute_variance"
		it "Verify if the variance calculus is correct" do
			variance = @rate.compute_variance([0.0,3.6,5.6,6.6,6.6,7.0,8.6,9.6])
			expect(variance.round(4)).to eq(7.9175)
		end
end