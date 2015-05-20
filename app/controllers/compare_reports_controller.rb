class CompareReportsController < ApplicationController

	def index
		
	end

	def request_comparation
		@first_report = Report.new(params[:first_year],params[:first_grade],params[:first_state])
		@first_report.request_report

		@second_report = Report.new(params[:second_year],params[:second_grade],params[:second_state])
		@second_report.request_report

		@comparation_hash = {:first_report => @first_report.report_result_hash,
		 :second_report => @second_report.report_result_hash}

		respond_to do |format|
			format.json { render json: @comparation_hash}
		end
		puts @comparation_hash
	end

end
