# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#new-request").on("ajax:success", (e, data, status, xhr) ->
    $("#new-request").append "<p>Sucesso</p>"
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new-request").append "<p>ERROR</p>"

jQuery ->
	Morris.Line({
	
		element: 'year',
		data: [
			{y: '2012', a:100} ,
			{y: '2013', a: 75} ,
			{y: '2014', a:120}

		],

		xkey: 'y'
		ykeys: ['a']
		labels: ['Series A']

});