require 'rspec'
require_relative '../app/controllers/report_controller'
require_relative '../app/models/grade'


describe ReportController do

  before :each do
<<<<<<< Updated upstream
    @report = Report.new(2011, "1° ano", "AC", "Total", "Total")
=======
    @report = Report.new(2011,"1° ano","AC","Total","Urbana")
>>>>>>> Stashed changes
    @report.request_report
  end

  describe "#request_report"
	it "take the params and set them to the object" do
	   expect(@report.report_result_hash).not_to eql(nil)
	end


end