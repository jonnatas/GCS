class CompareReportsController < ApplicationController

	def index
		
	end

	def request_comparation

		@first_report = verify_params_of_test_type(params[:first_year],params[:grade],params[:second_state],params[:first_test_type],params[:first_public_type],params[:first_local])
		@first_report.request_report

		@second_report = verify_params_of_test_type(params[:second_year],params[:grade],params[:second_state],params[:second_test_type],params[:second_public_type],params[:second_local])
		@second_report.request_report

		@comparation_hash = {:first_report => @first_report.report_result_hash,
		 :second_report => @second_report.report_result_hash}

		respond_to do |format|
			format.json { render json: @comparation_hash}
		end
		puts @comparation_hash
	end

	def verify_params_of_test_type(year,grade,state,test_type,public_type,local)

		if test_type == "Publica"
			if public_type == "Total"
				@report = Report.new(year,grade,state,"Publico",local) 
			else
				@report = Report.new(year,grade,state,public_type,local) 
			end
		else
			@report = Report.new(year,grade,state,test_type,local)
		end

		return @report
	end

end

