class ReportController < ApplicationController

	def index
		
	end

	def request_report
		@report = Report.new(params[:year],params[:id_grade],params[:id_state],params[:final_year])
	end


end
