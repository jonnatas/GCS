class Rate < ActiveRecord::Base

	attr_accessor :rate_hash, :evasion_average, :performance_average, :distortion_average

	def initialize(year, id_grade, id_state,final_year)
		@year = year
		@id_grade = id_grade
		@id_state = id_state
		@final_year = final_year
		request_rate_report
	end

	def request_rate_report
		@rate_request_result = Array.new
		@evasion_result = Array.new
		@performance_result = Array.new
		@distortion_result = Array.new


		(@year..@final_year).each do |year|
			current_rate = request_rate(year,@id_state,@id_grade)

			@evasion_result.push(current_rate.evasion)
			@performance_result.push(current_rate.performance)
			@distortion_result.push(current_rate.distortion)

			@rate_request_result.push(current_rate)
		end

		@rate_hash = {:evasion => @evasion_result, :performance => @performance_result, :distortion => @distortion_result}

		request_average_to_evasion
		request_average_to_performance
		request_average_to_distortion
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
		@performance_average = compute_average_for(@distortion_result)
	end
	private :request_average_to_distortion

	def compute_average_for(data)
		total_score = 0.0
		data.each do |current_data|
			total_score += current_data
		end
		return total_score/data.count
	end


	def request_rate(year,id_state,id_grade)
		return Rate.where(:year => year, :id_state => id_state, :id_grade => id_grade).first
	end
	private :request_rate
end
