App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: (data) ->
    console.log "cable working :)"
    console.log data

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alert data.foo
