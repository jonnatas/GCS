class Rate < ActiveRecord::Base
	include ReportHelper
	require 'Error'
	FINAL_GRADE = 9
	attr_accessor :rate_hash


	def initialize(year, grade_id, state_id, test_type, local)
		@year = year
		@grade_id = grade_id
		@state_id = state_id
		@test_type = test_type
		@local = local
		@final_year = Rate.final_year_avaiable( year, grade_id, state_id )
		@evasion_result = Array.new
		@performance_result = Array.new
		@distortion_result = Array.new
	end

	def self.final_year_avaiable( year, grade_id, state_id )

		final_year = ""
		#to use in the loop below , increments in one each loop
		grade_id_local = grade_id

		#will pick the last year avaiable and add 1
		local_final_year = Rate.all.pluck(:year).max.to_i + 1

		#loop to test if the line in the table with the params year and grade_id are empty
		(year.to_i..local_final_year).each do |year_test|

			table_line = Rate.where(:year => year_test,:state_id => state_id)

			grade_id_local = grade_id_local.to_i + 1 #increments each loop
			
			#if table_line is empty, means that we have a final year to use
			if table_line.empty?

				final_year = (year_test - 1).to_s
				break
			end
		end

		return final_year

	end

	def request_rate_report
		#auxiliar variable to receive the given grade_id and make casts to the value
		local_grade_id = @grade_id

		(@year.to_i..@final_year.to_i).each do |year|
			begin
				raise Error::FinalYearException if local_grade_id.to_i > FINAL_GRADE
				current_rate = request_rate(year,@state_id,local_grade_id, @test_type, @local)
				current_distortion = request_distortion(year,@state_id,local_grade_id, @test_type, @local)
				set_data_to_evasion_array(current_rate.evasion)
				set_data_to_performance_array(current_rate.peformance)
				set_data_to_distortion_array(current_distortion.distortion)
				local_grade_id = (local_grade_id.to_i + 1).to_s
			rescue
				
			end

		end

		request_analise_data
		generate_hash_result
	end

	def set_data_to_evasion_array(evasion)
		@evasion_result.push(evasion)
	end

	def set_data_to_performance_array(performance)
		@performance_result.push(performance)
	end

	def set_data_to_distortion_array(distortion)
		@distortion_result.push(distortion)
	end


	def generate_hash_result
		@rate_hash = {:evasion => @evasion_result,
			:performance => @performance_result,
			:distortion => @distortion_result,
			:evasion_average => @evasion_average,
			:performance_average => @performance_average,
			:distortion_average => @distortion_average,
			:evasion_standard_deviation => @standard_deviation_evasion,
			:performance_standard_deviation => @standard_deviation_performance,
			:distortion_standard_deviation => @standard_deviation_distortion,
			:evasion_variance => @variance_evasion,
			:performance_variance => @variance_performance,
			:distortion_variance => @variance_distortion}
	end

	def request_analise_data
		request_average_to_evasion
		request_average_to_performance
		request_average_to_distortion
		request_standard_deviation_evasion
		request_standard_deviation_performance
		request_standard_deviation_distortion
		request_variance_evasion
		request_variance_performance
		request_variance_distortion
	end

	def request_average_to_evasion
		@evasion_average = ReportHelper.compute_average_for(@evasion_result)
	end
	private :request_average_to_evasion

	def request_average_to_performance
		@performance_average = ReportHelper.compute_average_for(@performance_result)
	end
	private :request_average_to_performance

	def request_average_to_distortion
		@distortion_average = ReportHelper.compute_average_for(@distortion_result)
	end
	private :request_average_to_distortion

	def request_standard_deviation_evasion
		@standard_deviation_evasion = ReportHelper.compute_standard_deviation(@evasion_result)
	end
	private :request_standard_deviation_evasion

	def request_standard_deviation_performance
		@standard_deviation_performance = ReportHelper.compute_standard_deviation(@performance_result)
	end
	private :request_standard_deviation_performance

	def request_standard_deviation_distortion
		@standard_deviation_distortion = ReportHelper.compute_standard_deviation(@distortion_result)
	end
	private :request_standard_deviation_distortion

	def request_variance_evasion
		@variance_evasion = ReportHelper.compute_variance(@evasion_result)
	end
	private :request_variance_evasion

	def request_variance_performance
		@variance_performance = ReportHelper.compute_variance(@performance_result)
	end
	private :request_variance_performance

	def request_variance_distortion
		@variance_distortion = ReportHelper.compute_variance(@distortion_result)
	end
	private :request_variance_distortion


	def request_rate(year,state_id,grade_id,test_type,local)
		begin
			raise Error::NullElementAtDB if !Rate.exists?(:year => year, :state_id => state_id, :local => local, :test_type => test_type,
		 :grade_id => grade_id)
			return Rate.where(:year => year, :state_id => state_id, :local => local, :test_type => test_type,
		 :grade_id => grade_id).first
		rescue
			Rate.new(:year => year, :state_id => state_id, :local => local, :test_type => test_type,
		 :grade_id => grade_id, :performance => 0.0, :disapproval => 0.0, :evasion => 0.0)
		end
		
	end

	def request_distortion(year,state_id,grade_id,test_type,local)
		begin
			raise Error::NullElementAtDB if !Distortion.exists?(:year => year, :state_id => state_id, :local => local, :test_type => test_type,
			:grade_id => grade_id)
			Distortion.where(:year => year, :state_id => state_id, :local => local, :test_type => test_type,
			:grade_id => grade_id).first
		rescue
			Distortion.new(:year => year, :state_id => state_id, :local => local, :test_type => test_type,
			:grade_id => grade_id, :distortion => 0.0)
		end
	end
end
