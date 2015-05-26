class Ranking

	def initialize(year, grade, test_type, local, rate)
		@year = year
		@grade = grade
		@test_type = test_type
		@local = local
		@rate = rate
		@lista = Array.new
	end 

	def insert_it

		(states).each do |currentState|

			currentReport = Report.new(@year, @grade, currentState, @test_type, @local)
			currentReport.request_report

			lista.push(currentReport)
		end
	end

	def sort_it

		if @rate == "IDEB"
			lista.sort_by {|report| report[:ideb]}
		else 
			if @rate = "Evasão"
			lista.sort_by {|report| report[:evasion]}
		else 
			if @rate = "Rendimento"
			lista.sort_by {|report| report[:performance]}
		else 
			if @rate = "Distorção de idade"
			lista.sort_by {|report| report[:distortion]}
		end
	end
end