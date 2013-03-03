# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
@FriendsPoller =
  poll: ->
    setTimeout @request, 5000
  
  request: ->
    $.get($('#friends').data('url'))
  
  addFriends: (friends) ->
    if friends.length > 0
      $('#friends').html($(friends))
    @poll()
  

jQuery ->
  if $('#friends').length > 0
    FriendsPoller.poll()
