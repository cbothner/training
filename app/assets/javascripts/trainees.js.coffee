# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(document).on("click tap", ".interest_link", ->
    interests = $("#trainee_interests").val()
    interests += ", " if interests != ''
    $("#trainee_interests").val(interests + $(this).attr('data-interest'))
  )

  $(document).on("click tap", ".approval_button", ->
    fieldname = $(this).attr('data-field')
    field = $("#trainee_"+fieldname)
    field.focus()
    field.val($(this).attr('data-date')+' ')

  )

  $(document).on("change", "#trainee_status", ->
    if $(this).val() == "community"
      $(".hidden").removeClass("hidden")
  )

jQuery ->
  $("#trainee_phone").mask("(999) 999-9999")
