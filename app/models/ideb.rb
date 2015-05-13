class Ideb < ActiveRecord::Base

	attr_accessor :ideb_hash

	def initialize(year,state_id,grade_id)
		@year = year
		@state_id = state_id
		@grade_id = grade_id
		@ideb_result = Array.new
		@years = Array.new
		@grade_ids = Array.new
	end


	def request_ideb_report
		if @year.to_i <= 2011
			(@year.to_i..2011).each do |current_year|
				current_type = ""
				if @grade_id.to_i <= 5
					current_type = "early"
				else
					current_type = "final"
				end
				if current_year%2 != 0 && current_year != 2013
					current_ideb = request_ideb(current_year,@state_id,current_type)
					@ideb_result.push(current_ideb.score)
					@years.push(current_year.to_s)
					@grade_ids.push(@grade_id.to_s)
				end
				@grade_id = @grade_id.to_i + 1
			end
			request_analise_data
			generate_hash_result
		else
			@ideb_hash = {:status => "unavailable"}
		end
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
