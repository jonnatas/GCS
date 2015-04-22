class Rate < ActiveRecord::Base

	attr_accessor :rate_request_result

	def initialize(year, id_grade, id_state,final_year)
		@year = year
		@id_grade = id_grade
		@id_state = id_state
		@final_year = final_year
		request_rate_report
	end

	def request_rate_report
		@rate_request_result = Array.new

		(@year..@final_year).each do |year|
			current_rate = rate_dao.request_rate(year,@id_state,@id_grade)
			@rate_request_result.push(current_rate)
		end
	end
	private :request_rate_report


	def request_rate(year,id_state,id_grade)
		return Rate.where(:year => year, :id_state => id_state, :id_grade => id_grade).first
	end
	private :request_rate
end
