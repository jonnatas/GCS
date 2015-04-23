class ReportController < ApplicationController

	def index
		
	end

	def request_report
		@report = Report.new(params[:year],params[:id_grade],params[:id_state],params[:final_year])

		report_result_hash = {:prova_brasil => @report.prova_brasil.prova_brasil_hash, :rates => @report.rates.rate_hash}

		respond_to do |format|
			format.json { render json: @report.prova_brasil.prova_brasil_hash}
		end
	end


end
