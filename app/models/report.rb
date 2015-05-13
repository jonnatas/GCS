class Report
	#validates_presence_of :year, :id_grade, :id_state, :final_year, :message => "Can't be blank!"
	attr_accessor :report_result_hash

	def initialize(year, grade, state)
		@year = year
		@grade_id = Grade.grade_id_by_description(grade)
		@state_id = State.state_id_by_description(state)
	end

	def request_report
		ideb = Ideb.new(@year,@grade_id,@state_id)
		ideb.request_ideb_report

		rates = Rate.new(@year,@grade_id,@state_id)
		rates.request_rate_report

		@report_result_hash = {:ideb => ideb.ideb_hash,
		 :rates => rates.rate_hash,
		 :year => @year,
		 :grade => @grade_id}

	end
	public :request_report

end
