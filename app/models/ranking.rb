class Ranking

	attr_accessor :ranking_result_hash

	def initialize(year, grade)
		@year = year
		@grade_id = Grade.grade_id_by_description(grade)
		@test_type = "Total"
		@local = "Total"
		# @rate = rate
		@listaDis = Array.new
		@listaEvasion = Array.new
		@listaPeformance = Array.new
		@listaIdeb = Array.new
	end 

	def insert_it
		if @grade_id.to_i <= 5
			@current_type = "early"
		else
			@current_type = "final"
		end
		(State.all.pluck(:id).uniq.sort!).each do |currentState|
			
			currentDistortion = request_distortion(@year,currentState, @grade_id,@test_type,@local)
			currentRates = request_rates(@year,currentState, @grade_id,@test_type,@local)

			currentIdeb = request_ideb(@year,currentState, @current_type)
			@listaIdeb.push(currentIdeb)

			@listaDis.push(currentDistortion)
			@listaEvasion.push(currentRates)
			@listaPeformance.push(currentRates)
		end

		if @ideb_status == "avaliable"
			@listaIdeb.sort_by!{|ideb| -ideb.score}
		end


		@listaEvasion = @listaEvasion.sort_by!{|rates| rates.evasion}
		@listaPeformance = @listaPeformance.sort_by!{|rates| -rates.peformance}
		@listaDistortion = @listaDis.sort_by!{|distortion| distortion.distortion}

		@ranking_result_hash = {
			:ideb_list => {:status => @ideb_status ,:ideb => @listaIdeb, :year => @year_ideb},
			:peformance_list => @listaPeformance,
			:evasion_list => @listaEvasion,
			:distortion_list => @listaDistortion
		}
	end

	def request_distortion(year,state_id,grade_id,test_type,local)
		Distortion.where(:year => year, :state_id => state_id, :local => local, :test_type => test_type,
			:grade_id => grade_id).first
	end

	def request_rates(year,state_id,grade_id,test_type,local)
		 Rate.where(:year => year, :state_id => state_id, :local => local, :test_type => test_type,
		 :grade_id => grade_id).first
	end

	def request_ideb(year,state_id,type)
		begin
			raise Error::NoDataToSelectedYear if year.to_i > Ideb.maximum(:year)
			raise Error::NoDataForSelectedGrade if year.to_i%2 == 0
			@ideb_status = "avaliable"
			return Ideb.where(:year => year, :state_id => state_id, :test_type => type).first
		rescue
			@ideb_status = "unavaliable"
			@year_ideb = year
		end

	end
end