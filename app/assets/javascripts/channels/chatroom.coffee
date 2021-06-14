App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: (data) ->
    console.log "cable working :)"
    console.log data


  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log "data received :)"
    console.log data
    window.alert data.foo
