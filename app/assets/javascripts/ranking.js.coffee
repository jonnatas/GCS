# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  console.log ("opa")

  $("#new-ranking-request").submit(() ->
    $("#ranking-container").empty()
    target = document.getElementById('loading');
    new Spinner({color:'#000', lines: 12}).spin(target);
    )

  $("#new-ranking-request").on("ajax:success", (e, data, status, xhr) ->
    console.log data
    $("#ranking-container").empty().append(rankingHTML)
    $("#evasion_text").empty()
    $("#loading").empty()
    $("#ranking-container").show()
    listDistortionRanking(data, '#distortion')
    listEvasionRanking(data, '#evasion')
    listPeformanceRanking(data, '#peformance')
    listIDEBRanking(data, '#ideb')

  )

listIDEBRanking = (data, div) ->
	console.log data
	if data.ideb_list.status == "avaliable" 
		states = getNameList(data.ideb_list.ideb)
		str = ""
		i=0
		for object in data.ideb_list.ideb by 1
			if object == data.ideb_list.ideb[0]
				str = str + '&nbsp;</br><b><font color = "#00FF00" size = "3">' + (i+1) + '° ' + states[i] + ' - ' + object.score + ' pontos</font></b></br>'
			else	
				str = str + "&nbsp;</br><b>" + (i+1) + "°</b> " + states[i] + " - " + object.score + " pontos</br>"
			i++
		console.log str
		$(div).append "#{str}"
	else 
		if data.ideb_list.year == '2013'
			$(div).append '<font color = "red"> Não há dados disponibilizados referentes a prova IDEB de ' + data.ideb_list.year + '</font>'
		else
			$(div).append '<font color = "red"> No ano de ' + data.ideb_list.year + ' não houve aplicação da prova IDEB</font>'

listDistortionRanking = (data, div) ->
	states = getNameList(data.distortion_list)
	str = ""
	i=0
	for object in data.distortion_list by 1
		if object == data.distortion_list[0]
			str = str + '&nbsp;</br><b><font color = "#00FF00" size = "3">' + (i+1) + '° ' + states[i] + ' - ' + object.distortion + ' %</font></b></br>'
		else
			str = str + "&nbsp;</br><b>" + (i+1) + "°</b> " + states[i] + " - " + object.distortion + " %</br>"
		i++ 
	$(div).append "#{str}"

listEvasionRanking = (data, div) ->
	states = getNameList(data.evasion_list)
	str = ""
	i=0
	for object in data.evasion_list by 1
		if object == data.evasion_list[0]
			str = str + '&nbsp;</br><b><font color = "#00FF00" size = "3">' + (i+1) + '° ' + states[i] + ' - ' + object.evasion + ' %</font></b></br>'
		else			
			str = str + "&nbsp;</br><b>" + (i+1) + "°</b> " + states[i] + " - " + object.evasion + " %</br>"
		i++ 
	$(div).append "#{str}"

listPeformanceRanking = (data, div) ->
	states = getNameList(data.peformance_list)
	str = ""
	i=0
	for object in data.peformance_list by 1
		if object == data.peformance_list[0]
			str = str + '&nbsp;</br><b><font color = "#00FF00" size = "3">' + (i+1) + '° ' + states[i] + ' - ' + object.peformance + ' %</font></b></br>'
		else
			str = str + "&nbsp;</br><b>" + (i+1) + "°</b> " + states[i] + " - " + object.peformance + " %</br>"
		i++ 
	$(div).append "#{str}"

getNameList = (data) ->
	listStates =  []
	i=0
	for object in data by 1
		state = object.state_id
		listStates[i] = getNameState(state)
		i++
	return listStates

getNameState = (idState) ->
	switch idState
		when 1 then return "Acre"
		when 2 then return "Alagoas"
		when 3 then	return "Amapá"
		when 4 then return "Amazonas"
		when 5 then return "Bahia"
		when 6 then return "Ceará"
		when 7 then return "Destrito Federal"
		when 8 then return "Espírito Santo"
		when 9 then	return "Goiás"
		when 10 then return "Maranhão"
		when 11 then return "Mato Grosso"
		when 12 then return "Mato Grosso do Sul"
		when 13 then return "Minas Gerais"
		when 14 then return "Pará"
		when 15 then return "Paraíba"
		when 16 then return "Paraná"
		when 17 then return "Pernambuco"
		when 18 then return "Piauí"
		when 19 then return "Rio de Janeiro"
		when 20 then return "Rio Grande do Norte"
		when 21 then return "Rio Grande do Sul"
		when 22 then return "Rondônia"
		when 23 then return "Roraima"
		when 24 then return "Santa Catarina"
		when 25 then return "São Paulo"
		when 26 then return "Sergipe"
		when 27 then return "Tocantins"
		


rankingHTML = '
	
				<div id="ranking-container">

					<div id="table-ranking-distortion">

					</div>
					
				</div>

				<div class="TabControl"> 
					<div id="header"> 
						<ul class="abas"> 
							
							<li> 
								<div class="aba"> 
										<span>Evasão </span> 
								</div> 
							</li>
							<li> 
								<div class="aba"> 
									<span>Rendimento </span> 
								</div> 
							</li> 
							<li> 
								<div class="aba"> 
									<span>Distorção	</span> 
								</div> 
							</li> 
							<li> 
								<div class="aba"> 
										<span>IDEB </span> 
								</div> 
							</li> 

						</ul> 

					</div> 
						
					<div id="content"> 
						<div id ="evasion" class="conteudo">
							<p style=" text-align: justify;"><font face="cursive"> &nbsp
               O Índice de Evasão retrata o percentual de alunos que deixaram
               de frequentar a escola, caracterizando dessa forma abandono escolar.
               Tal índice é obtido por meio do Censo Escolar pelo Inep e
               compõe o Índice de Desenvolvimento da Educação Brasileira (Ideb).
             	</font></p>
             	<b><font size = "4"> Ranking Brasileiro: </font></b></br>
            </div>

						<div id ="peformance" class="conteudo">
							<p style=" text-align: justify;"><font face="cursive"> &nbsp
               O Índice de Rendimento é baseado na Anresc. A Avaliação Nacional do Redimento
               Escolar (Anresc) é uma avaliação criada pelo Ministério da Educação. Sendo
               complementar ao Sistema Nacional de Educação Básica e um dos componentes para
               o cálculo do Índice de Desenvolvimento da Educação Básica, a avaliação é realizada
               a cada dois anos e participam todos os estudantes de escolas públicas urbanas do 5º
               ao 9º ano em turmas com 20 ou mais alunos.
               A avaliação é dividida em duas provas: Língua Portuguesa e Matemática.
             	</font></p>
             	<b><font size = "4"> Ranking Brasileiro: </font></b></br>
						</div>

						<div id ="distortion" class="conteudo">
							<p style=" text-align: justify;"><font face="cursive"> &nbsp
                O Índice de Distorção representa o percentual de alunos que se encontram em
                condição de distorção idade-série.
                O aluno que reprova ou abandona os estudos por dois anos ou mais
                durante a trajetória de escolarização, repetindo por consequência uma mesma
                série, se encontra em defasem em relação à idade considerada adequada para
                cada ano de estudo, de acordo com o que propõe a legislação educacional do
                país.
             	</font></p>
             	<b><font size = "4"> Ranking Brasileiro: </font></b></br>

						</div> 
						<div id="ideb" class="conteudo">
							<p style=" text-align: justify;"><font face="cursive"> &nbsp
                O Índice de Desenvolvimento da Educação Básica (Ideb) tem o objetivo de
                reunir em um único indicador dois conceitos importantes para a qualidade
                da educação: fluxo escolar e média de desempenho nas avaliações.
                Ele agrega ao enfoque pedagógico dos resultados das avaliações em larga escala do
                <a href="http://portal.inep.gov.br/" target="_blank">Inep</a>
                a possibilidade de resultados sintéticos, facilmente assimiláveis, e que permitem
                traçar metas de qualidade educacional para os sistemas. O indicador é calculado
                a partir dos dados sobre aprovação, obtidos no Censo Escolar, e médias de desempenho
                nas avaliações do Inep: o Seab (para unidades da federação e para o país) e a Prova
                Brasil (para os municípios).
             	</font></p>
             	<b><font size = "4"> Ranking Brasileiro: </font></b></br>
            </div>
						
					</div> 
			</div>

				
			<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>


				<script type="text/javascript">
				 $(document).ready(function(){ 
						 $("#content div:nth-child(1)").show(); 
						 $(".abas li:first div").addClass("selected");
						 $(".aba").click(function(){ 
						 		$(".aba").removeClass("selected"); 
						 		$(this).addClass("selected");
						 		var indice = $(this).parent().index();
						 		indice++;
						 		$("#content div").hide();
						 		$("#content div:nth-child("+indice+")").show();
    						$("#evasion_text div").show();
						 });
							$(".aba").hover( 
								function(){$(this).addClass("ativa")},
								function(){$(this).removeClass("ativa")}
							);	
					}); 
				</script>
				'

