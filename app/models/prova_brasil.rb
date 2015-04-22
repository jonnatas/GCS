class ProvaBrasil < ActiveRecord::Base
	
	def request_prova_brasil(year, id_state, id_grade)
		return ProvaBrasil.where(:year => year,:id_grade => id_grade, :id_state => id_state).first
	end
end
