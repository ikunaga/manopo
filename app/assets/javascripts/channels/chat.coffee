App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alert data['chat_message']

  received: (data) ->
    $('#chat_messages').append data['chat_message']

  post: (chat_message)->
    @perform 'post', chat_message: chat_message


$(document).on 'keypress', '[data-behavior~=chat_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.chat.post event.target.value
    event.target.value = ''
    event.preventDefault()

