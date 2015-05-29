class ReportController < ApplicationController

	def index
		
	end

	def request_report
		test_type_analyzer

		@report = Report.new(params[:year],params[:grade],params[:state],@test_type,params[:local])

		@report.request_report

		respond_to do |format|
			format.json { render json: @report.report_result_hash}
		end
		puts @report.report_result_hash
	end

	def test_type_analyzer
		if params[:test_type] == "Publica"
			if params[:public_type] == "Total"
				@test_type = "Publico"
			else
				@test_type = params[:public_type]
			end
		else
			@test_type = params[:test_type]
		end
	end

end
