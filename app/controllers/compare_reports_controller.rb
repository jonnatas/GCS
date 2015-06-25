class CompareReportsController < ApplicationController

	include ReportHelper

	def index
		
	end

	def request_comparation

		@first_report = create_report_to_compare(params[:first_year],params[:first_state],params[:first_test_type],params[:first_public_type],params[:first_local])
		@second_report = create_report_to_compare(params[:second_year],params[:second_state],params[:second_test_type],params[:second_public_type],params[:second_local])

		@comparation_hash = {:first_report => @first_report.report_result_hash,
		 :second_report => @second_report.report_result_hash}

		respond_to do |format|
			format.json { render json: @comparation_hash}
		end

	end



	def create_report_to_compare(year, state, test_type, public_type, local)
		@report = ReportHelper.verify_params_of_test_type(year,params[:grade],state,test_type,public_type,local)
		@report.request_report

		return @report

	end



end



