# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.o


req = $.getJSON '/bricks/'
req.success (data) ->
  window.last = data[0]['created_at']
  trhtml = '';
  $.each(data, (i, item) -> trhtml += ('<tr><td>'+item['id']+'</td><td>'+item['type_of_brick']+'</td><td>'+item['updated_at']+'</tr></td>'))
  $('tbody').append(trhtml)
  setInterval(checkIfNew, 500)


req.error () -> alert('Could not connect')

updateTable = () ->
  request = $.getJSON '/lastitem'
  request.success (item) ->
    append = '<tr><td>'+item['id']+'</td><td>'+item['type_of_brick']+'</td><td>'+item['updated_at']+'</tr></td>'
    $('tbody').prepend(append)


checkIfNew = () ->
  request = $.getJSON '/lasttimestamp'
  request.success (item) ->
    if(item != window.last)
      updateTable()
      window.last = item

