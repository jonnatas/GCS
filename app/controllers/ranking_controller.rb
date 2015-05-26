class RankingController < ApplicationController
  def index
  end

  def request_ranking
  	@ranking = Ranking.new(params[:year],params[:grade],params[:test_type],params[:local],params[:rate])
  end
end
