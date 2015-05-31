class CompareReportsController < ApplicationController

	include ReportHelper

	def index
		
	end

	def request_comparation

		@first_report = ReportHelper.verify_params_of_test_type(params[:first_year],params[:grade],params[:first_state],params[:first_test_type],params[:first_public_type],params[:first_local])
		@first_report.request_report

		@second_report = ReportHelper.verify_params_of_test_type(params[:second_year],params[:grade],params[:second_state],params[:second_test_type],params[:second_public_type],params[:second_local])
		@second_report.request_report

		@comparation_hash = {:first_report => @first_report.report_result_hash,
		 :second_report => @second_report.report_result_hash}

		respond_to do |format|
			format.json { render json: @comparation_hash}
		end
		puts @comparation_hash
	end

end

