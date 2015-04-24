# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#new-request").on("ajax:success", (e, data, status, xhr) ->
    $("#row").append "<div id='prova-brasil-portuguese-report'></div>"
    plot(data, 'prova-brasil-portuguese-report')
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#row").append "<p>ERROR</p>"


plot = (data,div) ->
	new Morris.Line({

	element: div,
	data: [
		{y: '2012', a:10} ,
		{y: '2013', a: 7,4} ,
		{y: '2014', a:4}
	],

	xkey: 'y'
	ykeys: ['a']
	labels: ['Series A']

	})