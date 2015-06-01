class RankingController < ApplicationController
  def index
  end

  def request_ranking
  	puts " Hello world"

  	@ranking = Ranking.new(params[:year],params[:grade])
  	@ranking.insert_it

  	# puts @ranking

  end
end
