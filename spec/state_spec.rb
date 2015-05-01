require 'rspec'
require_relative'../app/models/state'

describe State do
  before :each do
    @state_id = State.id_by_description("AC")
  end

  describe "#id_by_description"
    it "takes description parameter and return a state id" do
      expect(@state_id).to eq(1)
    end


end