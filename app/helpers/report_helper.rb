module ReportHelper

	def self.compute_average_for(data)
		total_score = 0.0
		data.each do |current_data|
			total_score += current_data
		end
		return total_score/data.count
	end

	def self.compute_standard_deviation(data)
		average = compute_average_for(data)
		total_variance = 0.0
		data.each do |current_data|
			total_variance += (current_data - average)**2
		end

		total_variance = total_variance/data.count
		standard_deviation 	= total_variance**(0.5)
		return standard_deviation

	end

	def self.compute_variance(data)
		average = compute_average_for(data)
		total_variance = 0.0
		data.each do |current_data|
			total_variance += (current_data - average)**2
		end

		return total_variance/data.count
	end

	def self.verify_params_of_test_type(year,grade,state,test_type,public_type,local)

		if test_type == "Publica"
			if public_type == "Total"
				@report = Report.new(year,grade,state,"Publico",local) 
			else
				@report = Report.new(year,grade,state,public_type,local) 
			end
		else
			@report = Report.new(year,grade,state,test_type,local)
		end

		return @report
	end

end
