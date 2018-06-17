# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
console.log(123)
$(document).on('turbolinks:load', () ->
  readURL = (input) ->
    if input.files && input.files[0]
      reader = new FileReader()

      reader.onload = (e) ->
        $('#user_avatar_show').attr('src', e.target.result)

      reader.readAsDataURL(input.files[0]);


  $("#user_avatar").change(()->
    readURL(@)
  )
);

