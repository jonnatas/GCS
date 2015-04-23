class ProvaBrasil < ActiveRecord::Base

	attr_accessor :prova_brasil_hash, :portuguese_average_score,
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
		@math_score_result = Array.new
		@portuguese_score_result = Array.new

		(@year..@final_year).each do |year|
			current_prova_brasil = request_prova_brasil(year,@id_state,@id_grade)

			@math_score_result.push(current_prova_brasil.portuguese_score)
			@portuguese_score_result.push(current_prova_brasil.math_score)

			@prova_brasil_request_result.push(current_prova_brasil)
		end

		request_average_to_portuguese
		request_average_to_math
		@prova_brasil_hash = {:portuguese_score => @portuguese_score_result, :portguese_average => @portuguese_average_score,
		 :math_score => @math_score_result, :math_average => @math_average_score}
	end
	private :request_prova_brasil_report

	def request_average_to_portuguese
		@portuguese_average_score = compute_average_for(@portuguese_score_result)
	end
	private :request_average_to_portuguese

	def request_average_to_math
		@math_average_score = compute_average_for(@math_score_result)
	end
	private :request_average_to_math

	def compute_average_for(data)
		total_score = 0.0
		data.each do |current_data|
			total_score += current_data
		end
		return total_score/data.count
	end

	def request_prova_brasil(year, id_state, id_grade)
		return ProvaBrasil.where(:year => year,:id_grade => id_grade, :id_state => id_state).first
	end
	private :request_prova_brasil_report
end
