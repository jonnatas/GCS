# :nocov:
class Parse < ActiveRecord::Base
# :nocov:
	def self.import(file,type)
		if type == 'IDEB'
			Parse.ideb_impot(file)
		elsif type == 'DISTORTION'
			Parse.distortion_impot(file)
		elsif type == 'RATE'
			Parse.rate_impot(file)
		end
	end

	def self.ideb_impot(file)
		CSV.foreach(file.path, headers: true, encoding: "iso-8859-1:UTF-8") do |row|
			hashed_row = row.to_hash
			state_id = State.state_id_by_description(hashed_row["uf"])
			test_type = hashed_row["tipo"] == "Particular" ? "Privada" : hashed_row["tipo"]
			current_ideb = Ideb.create(:year => hashed_row["ano"], :state_id => state_id, :score => hashed_row["ideb"],
			:test_type => test_type)
		end
	end

	def self.rate_impot(file)
		CSV.foreach(file.path, headers: true, encoding: "iso-8859-1:UTF-8") do |row|
			hashed_row = row.to_hash
			state_id = State.state_id_by_description(hashed_row["abrangencia"])
			test_type = hashed_row["Rede"] == "Particular" ? "Privada" : hashed_row["Rede"]
			(1..9).each do |current_grade|
				current_rate = Rate.create(:year => hashed_row["ano"],:state_id => state_id, :local => hashed_row["local"],
				:test_type => test_type,:peformance => hashed_row["ap_#{current_grade}"],
				:disapproval => hashed_row["rp_#{current_grade}"],:evasion => hashed_row["ab_#{current_grade}"],
				:grade_id => current_grade)
			end
		end
	end

	def self.distortion_impot(file)
		CSV.foreach(file.path, headers: true, encoding: "iso-8859-1:UTF-8") do |row|
			hashed_row = row.to_hash
			state_id = State.state_id_by_description(hashed_row["uf"])
			test_type = hashed_row["Rede"] == "Particular" ? "Privada" : hashed_row["Rede"]
			(1..9).each do |current_grade|
				current_distortion = Distortion.create(:year => hashed_row["ano"],:state_id => state_id, :local => hashed_row["local"],
				:test_type => test_type,:distortion => hashed_row["di_#{current_grade}"],:grade_id =>current_grade)
			end
		end
	end
# :nocov:
end
# :nocov: