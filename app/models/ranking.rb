class Ranking

	attr_accessor :ranking_result_hash

	def initialize(year, grade)
		@year = year
		@grade_id = Grade.grade_id_by_description(grade)
		@test_type = "Total"
		@local = "Total"
		# @rate = rate

		@listaDis = Array.new
		@listaRat = Array.new
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

			if(@year%2 != 0)
				print @year
			  currentIdeb = request_ideb(@year,currentState, @current_type)
			  @listaIdeb.push(currentIdeb)
			end

			@listaDis.push(currentDistortion)
			@listaRat.push(currentRates)
		end

		if(@listaIdeb.empty?)
			@listaIdeb.sort_by!{|ideb| ideb.score}
		end
		@listaPeformance = @listaRat.sort_by!{|rates| rates.peformance}
		@listaEvasion = @listaRat.sort_by!{|rates| rates.evasion}
		@listaDistortion = @listaDis.sort_by!{|distortion| distortion.distortion}

		@ranking_result_hash = {
			:ideb_list => @listaIdeb,
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
		Ideb.where(:year => year, :state_id => state_id, :test_type => type).first
	end

end