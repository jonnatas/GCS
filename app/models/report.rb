class Report
	def initialize(year, id_grade, id_state,final_year)
		@year = year
		@id_grade = id_grade
		@id_state = id_state
		@final_year = final_year
	end

	def request_report
		request_prova_brasil_report
		request_rate_report
	end

	def request_prova_brasil_report
		prova_brasil_dao = ProvaBrasil.new

		@prova_brasil_request_result = Array.new

		(@year..@final_year).each do |year|
			current_prova_brasil = prova_brasil_dao.request_prova_brasil(year,@id_state,@id_grade)
			@prova_brasil_request_result.push(current_prova_brasil)
		end
		request_average_to_portuguese
		request_average_to_math
	end
	private :request_prova_brasil_report

	def request_average_to_portuguese
		total_years = @final_year - @year
		total_score = 0.0

		@prova_brasil_request_result.each do |current_prova_brasil|
			total_score += current_prova_brasil.portuguese_score
		end
		return total_score/total_years
	end

	def request_average_to_math
		total_years = @final_year - @year
		total_score = 0.0

		@prova_brasil_request_result.each do |current_prova_brasil|
			total_score += current_prova_brasil.math_score
		end
		return total_score/total_years
	end


	def request_rate_report
		rate_dao = Report.new

		@rate_request_result = Array.new

		(@year..@final_year).each do |year|
			current_rate = rate_dao.request_rate(year,@id_state,@id_grade)
			@rate_request_result.push(current_rate)
		end
	end
	private :request_rate_report


end