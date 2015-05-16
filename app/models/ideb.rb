class Ideb < ActiveRecord::Base

	attr_accessor :ideb_hash

	def initialize(year,grade_id,state_id)
		@year = year
		@state_id = state_id
		@grade_id = grade_id
		@ideb_result = Array.new
		@years = Array.new
		@grade_ids = Array.new
	end


	def request_ideb_report
		(@year.to_i..2011).each do |current_year|
			current_type = ""
			if @grade_id.to_i <= 5
				current_type = "early"
			else
				current_type = "final"
			end
			if current_year%2 != 0 && current_year != 2013
				current_ideb = request_ideb(current_year,@state_id,current_type)
				set_data_to_ideb_result_array(current_ideb.score)
				set_data_to_years_array(current_year.to_s)
				set_data_to_grade_ids_array(@grade_id.to_s)
			end
			@grade_id = @grade_id.to_i + 1
		end
		request_analise_data
		generate_hash_result
	end

	def set_data_to_ideb_result_array(ideb)
		@ideb_result.push(ideb)
	end

	def set_data_to_years_array(current_year)
		@years.push(current_year)
	end

	def set_data_to_grade_ids_array(grade)
		@grade_ids.push(grade)
	end

	def request_analise_data
		request_average_to_ideb
		request_standard_deviation_to_ideb
		request_variance_to_ideb
	end

	def generate_hash_result
		@ideb_hash = {:status => "available" ,:ideb => @ideb_result, :ideb_average => @ideb_average,
		 :ideb_standard_deviation => @standard_deviation_ideb,
		 :ideb_variance => @variance_ideb,
		:ideb_years => @years,
		:ideb_grade_ids => @grade_ids}
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

	def request_ideb(year,state_id,type)
		return Ideb.where(:year => year, :state_id => state_id, :test_type => type).first
	end

end
