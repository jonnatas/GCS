# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  console.log ("opa")
  $("#new-ranking-request").on("ajax:success", (e, data, status, xhr) ->
    console.log data
    $("#ranking-container").empty().append(rankingHTML)
    $("#ranking-container").show()
    listAverageRanking(data, '#ranking-container')
  )

listAverageRanking = (data, div) ->
	idStates = getNameList(data.distortion_list)
	console.log idStates 
	$(div).append "Estado : #{idStates}"

getNameList = (data) ->
	listStates =  []
	i=0
	for object in data by 1
		state = object.state_id
		listStates[i] = state
		i++
	return listStates

rankingHTML = '
	
				<div id="ranking-container">
					
				</div>'