class ReportController < ApplicationController

	def index
		
	end

	def request_report
		if params[:test_type] == "Publica"
			if params[:public_type] == "Total"
				@report = Report.new(params[:year],params[:grade],params[:state],"Publico",params[:local]) 
			else
				@report = Report.new(params[:year],params[:grade],params[:state],params[:public_type],params[:local]) 
			end
		else
			@report = Report.new(params[:year],params[:grade],params[:state],params[:test_type],params[:local])
		end
		@report.request_report

		respond_to do |format|
			format.json { render json: @report.report_result_hash}
		end
		puts @report.report_result_hash
	end

end
