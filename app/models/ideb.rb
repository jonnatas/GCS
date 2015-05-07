class Ideb < ActiveRecord::Base

	attr_accessor :ideb_hash

	def initialize(year,uf,grade)
		@year = year
		@uf = uf
		@grade = grade
		@ideb_result = Array.new
	end


	def request_ideb_report
		(@year.to_i..2011).each do |current_year|
			current_type = ""
			if @grade.to_i <= 5
				current_type = "inicial"
			else
				current_type = "final"
			end
			if current_year%2 != 0 && current_year != 2013
				current_ideb = request_ideb(current_year, current_type,@uf)
				@ideb_result.push(current_ideb.ideb)
			end
			@grade = @grade.to_i + 1
		end
		request_analise_data
		generate_hash_result
	end

	def request_analise_data
		request_average_to_ideb
		request_standard_deviation_to_ideb
		request_variance_to_ideb
	end

	def generate_hash_result
		@ideb_hash = {:ideb => @ideb_result, :ideb_average => @ideb_average,
		 :ideb_standard_deviation => @standard_deviation_ideb,
		 :ideb_variance => @variance_ideb} 
	end

	def request_ideb(year,type,uf)
		return Ideb.where(:ano => year, :uf => uf, :tipo => type).first
	end

	def request_average_to_ideb
		@ideb_average = ReportHelper.compute_average_for(@ideb_result)
	end
	private :request_average_to_ideb

	def request_standard_deviation_to_ideb
		@standard_deviation_ideb = ReportHelper.compute_standard_deviation(@ideb_result)
	end
	private :request_standard_deviation_to_ideb

	def request_variance_to_ideb
		@variance_ideb = ReportHelper.compute_variance(@ideb_result)
	end
	private :request_variance_to_ideb


	
end
