# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#new-request").on("ajax:success", (e, data, status, xhr) ->
    document.write(data.prova_brasil)
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new-request").append "<p>ERROR</p>"