class Report
	#validates_presence_of :year, :id_grade, :id_state, :final_year, :message => "Can't be blank!"
	attr_accessor :report_result_hash

	def initialize(year, id_grade, state)
		@year = year
		@id_grade = id_grade
		@id_state = state
	end

	def request_report
		#prova_brasil = ProvaBrasil.new(@year,@id_grade,@id_state)
		#prova_brasil.request_prova_brasil_report

		rates = Rate.new(@year,@id_grade,@id_state)
		rates.request_rate_report

		@report_result_hash = {:prova_brasil => nil,#prova_brasil.prova_brasil_hash,
		 :rates => rates.rate_hash,
		 :year => @year,
		 :grade => @id_grade}

	end
	public :request_report

end
