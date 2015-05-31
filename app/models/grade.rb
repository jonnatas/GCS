class Grade < ActiveRecord::Base
	def self.grade_id_by_description(description)
		grae_id = Grade.where(:grade => description).first.id
	end
end
