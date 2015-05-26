class Ranking

	def initialize(year, grade)
		@year = year
		@grade = grade
		@test_type = "Total"
		@local = "Total"
		# @rate = rate

		@lista = Array.new

	end 

	def insert_it

		(State.all.pluck(:state).uniq.sort!).each do |currentState|
			
			currentReport = Report.new(@year, @grade, currentState, @test_type, @local)
			currentReport.request_report
			@lista.push(currentReport)

		end

		puts @lista
	end

	#should be made by javascript
	# def sort_it()

	# 	if @rate == "IDEB"
	# 		lista.sort_by {|report| report[:ideb]}
	# 	else 
	# 		if @rate = "Evasão"
	# 		lista.sort_by {|report| report[:evasion]}
	# 	else 
	# 		if @rate = "Rendimento"
	# 		lista.sort_by {|report| report[:performance]}
	# 	else 
	# 		if @rate = "Distorção de idade"
	# 		lista.sort_by {|report| report[:distortion]}
	# 	end
	# end
end