class Report
	#validates_presence_of :year, :id_grade, :id_state, :final_year, :message => "Can't be blank!"
	attr_accessor :report_result_hash

	def initialize(year, id_grade, state)
		@year = year
		@id_grade = id_grade
		@id_state = state
	end

	def request_report
		ideb = Ideb.new(@year,@id_state,@id_grade)
		ideb.request_ideb_report

		rates = Rate.new(@year,@id_grade,@id_state)
		rates.request_rate_report

		@report_result_hash = {:ideb => ideb.ideb_hash,
		 :rates => rates.rate_hash,
		 :year => @year,
		 :grade => @id_grade}

	end
	public :request_report

end
