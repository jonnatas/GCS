class State < ActiveRecord::Base
	def self.state_id_by_description(description)
		state_id = State.where(:state => description).first.id
	end
end
