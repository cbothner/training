# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(document).on("click", ".interest_link", ->
    interests = $("#trainee_interests").val()
    $("#trainee_interests").val(interests + " " + $(this).attr('data-interest'))
  )

jQuery ->
  $("#trainee_phone").mask("(999) 999-9999")
