# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#new-request").on("ajax:success", (e, data, status, xhr) ->
  		result = formatDataToPlot(data.prova_brasil.math_score, data.year)
    $("#row").append "<div id='prova-brasil-portuguese-report'></div>"
    plot(result, 'prova-brasil-portuguese-report')
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#row").append "<p>ERROR</p>"

#Generic Method to plot an array of data at specific div
plot = (data,div) ->
	new Morris.Line({

	element: div,
	data: data,
	xkey: 'x'
	ykeys: ['y']
	labels: ['Series A']

	})
#Method to format an array of data to a format that function plot needs
formatDataToPlot = (data, year)->
	formatedData = []
	for value in data by 1
		formatedData.push {x: "#{year}", y: value}
		year++
	return formatedData
	