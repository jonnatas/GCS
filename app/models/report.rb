class Report
	
	attr_accessor :report_result_hash

	module Error

		class Standard < StandardError
		end

		class NoDataToSelectedYear < Standard
			def message
				"Sorry, but there is no record on DB for this year."
			end
		end
		
	end

	def initialize(year, grade, state)
		@year = year
		@grade_id = Grade.grade_id_by_description(grade)
		@state_id = State.state_id_by_description(state)
	end

	def request_report
		ideb = request_ideb
		rates = request_rate

		@report_result_hash = {:ideb => ideb,
		 :rates => rates,
		 :year => @year,
		 :grade => @grade_id}
	end

	private
	def request_ideb
		begin
			raise Error::NoDataToSelectedYear if @year.to_i > Ideb.maximum("year")
			@ideb = Ideb.new(@year,@grade_id,@state_id)
			@ideb.request_ideb_report
		rescue
			ideb = {:status => "unavailable"}
		end
	end
	def request_rate
		@rates = Rate.new(@year,@grade_id,@state_id)
		@rates.request_rate_report
	end

end
