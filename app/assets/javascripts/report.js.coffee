# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#new-request").on("ajax:success", (e, data, status, xhr) ->
  	#request plot for Prova Brasil data
    $("#portuguese-pb").append "<div id='prova-brasil-portuguese-report'></div>"
    plot(formatDataToPlotTwoLines(data.prova_brasil.portuguese_score,data.prova_brasil.math_score, data.year), 'prova-brasil-portuguese-report',
     ["Português","Matemática"],["#FF5600","#0A62A4"])

  	#request plot for Prova Brasil data
#    $("#math-pb").append "<div id='prova-brasil-math-report'></div>"
#    plot(formatDataToPlot(data.prova_brasil.math_score, data.year), 'prova-brasil-math-report',
#    ["Matemática"], ["#0A62A4"])
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#row").append "<p>ERROR</p>"

#Generic Method to plot an array of data at specific div
plot = (data,div,labels,colors) ->
	new Morris.Line({

	element: div,
	data: data,
	xkey: 'x'
	ykeys: ['y','y2']
	labels: labels
	#lineColors: colors
  })
#Method to format an array of data to a format that function plot needs
formatDataToPlot = (data, year)->
	formatedData = []
	for value in data by 1
		formatedData.push {x: "#{year}", y: value}
		year++
	console.log formatedData
	return formatedData

formatDataToPlotTwoLines = (data,dataTwo, year)->
  formatedData = []
  i = 0
  for value in data by 1
    formatedData.push {x: "#{year}", y: value, y2: dataTwo[i]}
    year++
    i++
  console.log formatedData
  return formatedData