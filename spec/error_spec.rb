require 'rspec'
require_relative'../app/Exceptions/Error.rb'

describe Error::FinalYearException do
	before :each do
		@error = Error::FinalYearException.new
	end
	describe "#message"
		  	it "Show the message" do 
		  		expect(@error.message).to eq("Final year reached")
		  	end
end

describe Error::NoDataForSelectedYear do
	before :each do
		@error = Error::NoDataForSelectedYear.new
	end
	describe "#message"
		  	it "Show the message" do 
		  		expect(@error.message).to eq("Sorry, but there is no record on DB for this year.")
		  	end
end

describe Error::NoDataForSelectedGrade do
	before :each do
		@error = Error::NoDataForSelectedGrade.new
	end
	describe "#message"
		  	it "Show the message" do 
		  		expect(@error.message).to eq("Sorry, but there is no record on DB for this grade.")
		  	end
end

describe Error::NullElementAtDB do
	before :each do
		@error = Error::NullElementAtDB.new
	end
	describe "#message"
		  	it "Show the message" do 
		  		expect(@error.message).to eq("Sorry, but there's no record on DB for this paramers. Returning an object with 0 in all attributs.")
		  	end
end