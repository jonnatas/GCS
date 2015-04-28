class ReportController < ApplicationController

	def index
		
	end

	def request_report
		@report = Report.new(params[:year],params[:id_grade],params[:id_state],params[:final_year])

		respond_to do |format|
			format.json { render json: @report.report_result_hash}
		end
		puts @report.report_result_hash
	end


end
