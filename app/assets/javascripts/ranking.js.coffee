# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  console.log ("opa")
  $("#new-ranking-request").on("ajax:success", (e, data, status, xhr) ->
    console.log data
    $("#ranking-container").empty().append(rankingHTML)
    $("#ranking-container").show()
    listDistortionRanking(data, '#distortion')
    listEvasionRanking(data, '#evasion')
    listPeformanceRanking(data, '#peformance')
    listIDEBRanking(data, '#ideb')

  )

listIDEBRanking = (data, div) ->
	console.log data
	if data.ideb_list.status == "avaliable" 
		console.log "OLAAAAAAAAAAAAAAAAAAAAA"
		states = getNameList(data.ideb_list.ideb)
		str = ""
		i=0
		for object in data.ideb_list.ideb by 1
			str = str + "&nbsp;</br><b>" + (i+1) + "°</b> " + states[i] + " - " + object.score + "</br>"
			i++
		console.log str
		$(div).append "#{str}"
	else 
		$(div).append "Dado indisponível"

listDistortionRanking = (data, div) ->
	states = getNameList(data.distortion_list)
	str = ""
	i=0
	for object in data.distortion_list by 1
		str = str + "&nbsp;</br><b>" + (i+1) + "°</b> " + states[i] + " - " + object.distortion + "</br>"
		i++ 
	$(div).append "#{str}"

listEvasionRanking = (data, div) ->
	states = getNameList(data.evasion_list)
	str = ""
	i=0
	for object in data.evasion_list by 1
		str = str + "&nbsp;</br><b>" + (i+1) + "°</b> " + states[i] + " - " + object.evasion + "</br>"
		i++ 
	$(div).append "#{str}"

listPeformanceRanking = (data, div) ->
	states = getNameList(data.peformance_list)
	str = ""
	i=0
	for object in data.peformance_list by 1
		str = str + "&nbsp;</br><b>" + (i+1) + "°</b> " + states[i] + " - " + object.peformance + "</br>"
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
										<span>IDEB </span> 
								</div> 
							</li> 
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

						</ul> 

				</div> 
					
				<div id="content"> 
					<div id="ideb" class="conteudo"></div> 
					<div id ="evasion" class="conteudo"></div>
					<div id = "peformance" class="conteudo"></div> 
					<div id ="distortion"class="conteudo"></div> 
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
						 });
							$(".aba").hover( 
								function(){$(this).addClass("ativa")},
								function(){$(this).removeClass("ativa")}
							);	
					}); 
				</script>
				'

