class ReportController < ApplicationController

	def index
		
	end

	def request_report
		if params[:test_type] == "Publica"
			if params[:public_type] == "Total"
				@report = Report.new(params[:year],params[:grade],params[:state],"Publico") 
			else
				@report = Report.new(params[:year],params[:grade],params[:state],params[:public_type]) 
			end
		else
			@report = Report.new(params[:year],params[:grade],params[:state],params[:test_type])
		end
		@report.request_report

		respond_to do |format|
			format.json { render json: @report.report_result_hash}
		end
		puts @report.report_result_hash
	end

end
