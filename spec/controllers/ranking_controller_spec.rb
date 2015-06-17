require 'rspec'
require 'rails_helper'


describe RankingController, :type =>:request do
	describe "GET #index"
    it "request index and return success" do
      get "ranking/index"
      expect(response).to render_template("index")
    end

end