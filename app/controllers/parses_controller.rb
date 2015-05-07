class ParsesController < ApplicationController



  def index
	  @parses = Parse.all
  end

  def new
	  @parses = Parse.new
  end

  def set_parse
	  @parses = Parse.find(params[:id])
  end

  def import
    Parse.import(params[:file])
    redirect_to parses_url, notice: "Taxas importadas com sucesso"
  end

  def parse_params
	  #params.require(:prova_brasil).permit(:ID_SAEB, :ID_REGIAO, :SIGLA_UF, :ID_UF, :ID_SERIE, :ID_TIPO_REDE, :ID_LOCALIZACAO, :ID_CAPITAL, :NU_PARTICIPANTES, :MEDIA_LP, :MEDIA_MT, :ERRO_PADRAO_LP, :ERRO_PADRAO_MT, :A, :B, :C, :D)
    #params.require(:rate).permit(:ano,:abrangencia,:local,:Rede,:ap_1,:ap_2,:ap_3,:ap_4,:ap_5,:ap_6,:ap_7,:ap_8,:ap_9,:ap_1_5,:ap_6_9,:total_ap_fun,:ap_1_m,:ap_2_m,:ap_3_m,:ap_4_m,:ap_total_m_n_s,:total_ap_m,:rp_1,:rp_2,:rp_3,:rp_4,:rp_5,:rp_6,:rp_7,:rp_8,:rp_9,:rp_1_5,:rp_6_9,:rp_total_fun,:rp_1_m,:rp_2_m,:rp_3_m,:rp_4_m,:total_rp_m_n_s,:total_rp_m,:ab_1,:ab_2,:ab_3,:ab_4,:ab_5,:ab_6,:ab_7,:ab_8,:ab_9,:ab_1_5,:ab_6_9,:total_ab_fun,:ab_1_m,:ab_2_m,:ab_3_m,:ab_4_m,:total_ab_n_s,:total_ab_m)
    #params.require(:distortion).permit(:ano,:regiao,:uf,:local,:Rede,:di_1,:di_2,:di_3,:di_4,:di_5,:di_6,:di_7,:di_8,:di_9,:di_1_5,:di_6_9,:total_fun,:di_1_m,:di_2_m,:di_3_m,:di_4_m,:total_med)
    params.require(:ideb).permit(:ideb,:uf,:ano,:tipo)
  end

end
