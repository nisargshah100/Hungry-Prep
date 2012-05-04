# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery.extend
  parseQuerystring: ->
    nvpair = {}
    qs = window.location.search.replace('?', '')
    pairs = qs.split('&')
    $.each pairs, (i, v) ->
      pair = v.split('=')
      nvpair[pair[0]] = pair[1]
    nvpair

id = $.parseQuerystring()["id"]

$ ->
  form = $('.edit_candidate')

  form.children(":input").blur ->
    $.post form.attr("action"), $(form).serialize(), (res) ->
      console.log(res)
      document.getElementById("flash-save").innerHTML = "Saved"
      setTimeout("document.getElementById('flash-save').innerHTML = ''", 1000)
      false
