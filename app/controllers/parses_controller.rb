class ParsesController < ApplicationController
  def import
  	Parse.import(params[:file])
  	redirect_to parses_url, notice: "Taxas importadas com sucesso"
  end

  def index
	@parses = Parse.all
  end

  def new
	@parses = Parse.new
  end

  def set_parse
	@parses = Parse.find(params[:id])
  end

  def parse_params
	params.require(:parse).permit(:ID_SAEB, :ID_REGIAO, :SIGLA_UF, :ID_UF, :ID_SERIE, :ID_TIPO_REDE, :ID_LOCALIZACAO, :ID_CAPITAL, :NU_PARTICIPANTES, :MEDIA_LP, :MEDIA_MT, :ERRO_PADRAO_LP, :ERRO_PADRAO_MT, :A, :B, :C, :D)
  end
end
