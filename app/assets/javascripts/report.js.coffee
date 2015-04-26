# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#new-request").on("ajax:success", (e, data, status, xhr) ->

  	$("#report-result").show()

  	#request plot for Prova Brasil data
  	plot(formatDataToPlot(data.prova_brasil.portuguese_score, data.year), 'portuguese-pb-graph',["Português"],["#FF5600"])
  	appendAverageToDiv(data.prova_brasil.portguese_average,"#portuguese-pb-average")
  	#request plot for Prova Brasil data
  	plot(formatDataToPlot(data.prova_brasil.math_score, data.year), 'math-pb-graph',["Matemática"], ["#0A62A4"])
  	appendAverageToDiv(data.prova_brasil.math_average,"#math-pb-average")

  	plot(formatDataToPlot(data.rates.evasion, data.year), 'rate-evasion-graph',["Evasão"],["#FF5600"])
  	appendAverageToDiv(data.rates.evasion_average, '#rate-evasion-average')

  	plot(formatDataToPlot(data.rates.performance, data.year), 'rate-performance-graph', ["Performace"],["#0A62A4"])
  	appendAverageToDiv(data.rates.performance_average, '#rate-performance-average')

  	plot(formatDataToPlot(data.rates.distortion, data.year), 'rate-distortion-graph', ["Distorção"],["#0A62A4"])
  	appendAverageToDiv(data.rates.distortion_average, '#rate-distortion-average')

  ).on "ajax:error", (e, xhr, status, error) ->
    $("#row").append "<p>ERROR</p>"

appendAverageToDiv = (data,div) ->
	$(div).append "<span>Média #{data.toFixed(2)}</span>"

#Generic Method to plot an array of data at specific div
plot = (data,div,labels,colors) ->
	new Morris.Line({

	element: div,
	data: data,
	xkey: 'x'
	ykeys: ['y']
	labels: labels
	lineColors: colors
	})
#Method to format an array of data to a format that function plot needs
formatDataToPlot = (data, year)->
	formatedData = []
	for value in data by 1
		formatedData.push {x: "#{year}", y: value}
		year++
	return formatedData
	