document.addEventListener 'turbolinks:load', ->
  App.chat = App.cable.subscriptions.create { channel: "ChatChannel", chatroom_id: $('#messages').data('chatroom_id') },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['chat_message']

  post: (chat_message, chatroom_id)->
    @perform 'post', chat_message: chat_message, chatroom_id: chatroom_id


$(document).on 'keypress', '[data-behavior~=chat_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.chat.post event.target.value, event.target.id
    event.target.value = ''
    event.preventDefault()



