class Report
	def initialize(year, id_grade, id_state,final_year)
		@year = year
		@id_grade = id_grade
		@id_state = id_state
		@final_year = final_year
	end

	def request_prova_brasil_report
		prova_brasil_dao = ProvaBrasil.new

		prova_brasil_request_result = Array.new

		(@year..@final_year).each do |year|
			current_prova_brasil = prova_brasil_dao.request_prova_brasil(year,@id_state,@id_grade)
			prova_brasil_request_result.push(current_prova_brasil)
		end
		return prova_brasil_request_result
	end

	def request_rate_report
		rate_dao = Report.new

		rate_request_result = Array.new

		(@year..@final_year).each do |year|
			current_rate = rate_dao.request_rate(year,@id_state,@id_grade)
			rate_request_result.push(current_rate)
		end
		return rate_request_result
	end
end