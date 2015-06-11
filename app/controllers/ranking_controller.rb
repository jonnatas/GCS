class RankingController < ApplicationController
  def index
  end

  def request_ranking

  	@ranking = Ranking.new(params[:year],params[:grade])
  	@ranking.insert_it

  	respond_to do |format|
  		format.json { render json: @ranking.ranking_result_hash}
  	end

  end
end
