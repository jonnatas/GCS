class State < ActiveRecord::Base

	def self.id_by_description(description)
		state = State.where(:state => description).first
		return state.id
	end

end
