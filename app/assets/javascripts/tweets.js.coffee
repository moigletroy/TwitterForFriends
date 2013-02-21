# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
@TweetsPoller =
  poll: ->
    setTimeout @request, 5000
  
  request: ->
    $.get($('#tweets').data('url'), after: $('.tweet').first().data('id'))
  
  addTweets: (tweets) ->
    if tweets.length > 0
      $('#tweets').prepend($(tweets))
    @poll()
  

jQuery ->
  if $('#tweets').length > 0
    TweetsPoller.poll()
