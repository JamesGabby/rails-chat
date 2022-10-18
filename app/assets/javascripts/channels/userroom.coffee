App.userroom = App.cable.subscriptions.create "UserroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $("#message-container-#{data.receiver_id}").append data.user_message
    $("#message-container-#{data.sender_id}").append data.user_message

    scroll_bottom()
