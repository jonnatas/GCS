class State < ActiveRecord::Base
	def self.state_id_by_description(description)
		state_id = State.where(:state => description).first.id
	end

	def self.state_description_by_id(id)
		state_id = State.where(:state => id).first.state
	end
end
