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

	
  
end