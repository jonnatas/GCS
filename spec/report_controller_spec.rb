require 'rspec'
require_relative '../app/controllers/report_controller'



describe ReportController do

  before :each do
    @report = Report.new(2011, 1, "AC")
    @report.request_report
  end

  describe "#request_report"
  it "take the params and set them to the object" do
     @report.report_result_hash.should be 
  end


end