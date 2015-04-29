class Rate < ActiveRecord::Base

	attr_accessor :rate_hash, :evasion_average, :performance_average, :distortion_average

	def initialize(year, id_grade, id_state,final_year)
		@year = year
		@id_grade = id_grade
		@id_state = id_state
		@final_year = final_year

		#@final_year = final_year_avaiable( year, id_grade, id_state )

		request_rate_report

	end

	def final_year_avaiable( year, id_grade, id_state )

		final_year = ""
		#to use in the loop below , increments in one each loop
		id_grade_local = id_grade

		#loop to test if the line in the table with the params year and id_grade are empty
		(year.to_i..2012).each do |year_test|

			table_line = Rate.where(:year => year_test,:id_grade => id_grade_local , :id_state => id_state)

			id_grade_local = id_grade_local.to_i + 1 #increments each loop
			
			#if table_line is empty, means that we have a final year to use
			if table_line.empty?

				final_year = (year_test - 1).to_s				
				break
			end
		end

		return final_year

	end

	def request_rate_report
		@rate_request_result = Array.new
		@evasion_result = Array.new
		@performance_result = Array.new
		@distortion_result = Array.new
		#auxiliar variable to receive the given id_grade and make casts to the value.
		local_id_grade = @id_grade

		(@year..@final_year).each do |year|
			current_rate = request_rate(year,@id_state,local_id_grade)
			#increments the id_grade through years.
			local_id_grade = (local_id_grade.to_i + 1).to_s 
			@evasion_result.push(current_rate.evasion)
			@performance_result.push(current_rate.performance)
			@distortion_result.push(current_rate.distortion)

			@rate_request_result.push(current_rate)
		end

		request_average_to_evasion
		request_average_to_performance
		request_average_to_distortion
		request_standard_deviation_evasion
		request_standard_deviation_performance
		request_standard_deviation_distortion

		@rate_hash = {:evasion => @evasion_result,
		 	:performance => @performance_result,
		 	:distortion => @distortion_result,
			:evasion_average => @evasion_average,
			:performance_average => @performance_average,
		  	:distortion_average => @distortion_average,
		  	:evasion_standard_deviation => @standard_deviation_evasion,
		  	:performance_standard_deviation => @standard_deviation_performance,
		  	:distortion_standard_deviation => @standard_deviation_distortion}
	end
	private :request_rate_report


	def request_average_to_evasion
		@evasion_average = compute_average_for(@evasion_result)
	end
	private :request_average_to_evasion

	def request_average_to_performance
		@performance_average = compute_average_for(@performance_result)
	end
	private :request_average_to_performance

	def request_average_to_distortion
		@distortion_average = compute_average_for(@distortion_result)
	end
	private :request_average_to_distortion

	def request_standard_deviation_evasion
		@standard_deviation_evasion = compute_standard_deviation(@evasion_result)
	end
	private :request_standard_deviation_evasion

	def request_standard_deviation_performance
		@standard_deviation_performance = compute_standard_deviation(@performance_result)
	end
	private :request_standard_deviation_performance

	def request_standard_deviation_distortion
		@standard_deviation_distortion = compute_standard_deviation(@distortion_result)
	end
	private :request_standard_deviation_distortion


	def compute_average_for(data)
		total_score = 0.0
		data.each do |current_data|
			total_score += current_data
		end
		return total_score/data.count
	end

	def compute_standard_deviation(data)
		average = compute_average_for(data)
		total_variance = 0.0
		data.each do |current_data|
			total_variance += (current_data - average)**2 
		end

		total_variance = total_variance/data.count
		standard_deviation 	= total_variance**(0.5)
		return standard_deviation
	end

	def request_rate(year,id_state,id_grade)
		return Rate.where(:year => year, :id_state => id_state, :id_grade => id_grade).first
	end
	private :request_rate
end
