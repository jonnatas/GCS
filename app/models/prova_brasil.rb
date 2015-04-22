class ProvaBrasil < ActiveRecord::Base

	attr_accessor :prova_brasil_request_result, :portuguese_average_score,
	:math_average_score


	def initialize(year, id_grade, id_state,final_year)
		@year = year
		@id_grade = id_grade
		@id_state = id_state
		@final_year = final_year
		request_prova_brasil_report
	end

	def request_prova_brasil_report
		@prova_brasil_request_result = Array.new

		(@year..@final_year).each do |year|
			current_prova_brasil = request_prova_brasil(year,@id_state,@id_grade)
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
		@portuguese_average_score = total_score/total_years
	end
	private :request_average_to_portuguese

	def request_average_to_math
		total_years = @final_year - @year
		total_score = 0.0

		@prova_brasil_request_result.each do |current_prova_brasil|
			total_score += current_prova_brasil.math_score
		end
		@math_average_score = total_score/total_years
	end
	private :request_average_to_math

	def request_prova_brasil(year, id_state, id_grade)
		return ProvaBrasil.where(:year => year,:id_grade => id_grade, :id_state => id_state).first
	end
	private :request_prova_brasil_report
end
