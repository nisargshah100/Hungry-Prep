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

  form.find(":input").blur ->
    $.post form.attr("action"), $(form).serialize()+"&ajax=1", (res) ->
      console.log(res)
      setTime()
      false
setTime = ()->
  date = new Date()
  document.getElementById('last-saved').className = 'flash'
  setTimeout("document.getElementById('last-saved').className = ''", 4000)
  document.getElementById('time').innerHTML = dayToString(date.getDay()) + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds() + AMorPM(date)
  $()


dayToString = (day) ->
  days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
  return days[day]

AMorPM = () ->
  date = new Date()
  if date.getHours() < 12 then " AM" else " PM"
