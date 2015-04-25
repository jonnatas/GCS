class Report
	#validates_presence_of :year, :id_grade, :id_state, :final_year, :message => "Todos os campos devem estar preenchidos!"
	attr_accessor :prova_brasil, :rates, :year

	def initialize(year, id_grade, state,final_year)
		@year = year
		@id_grade = id_grade
		@id_state = State.id_by_description(state)
		@final_year = final_year
		request_report
	end

	def request_report
		@prova_brasil = ProvaBrasil.new(@year,@id_grade,@id_state,@final_year)
		@rates = Rate.new(@year,@id_grade,@id_state,@final_year)
	end
	private :request_report

end