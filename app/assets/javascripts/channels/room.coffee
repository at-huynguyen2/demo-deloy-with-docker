

App.room = App.cable.subscriptions.create {
  channel: "RoomChannel",
  roomId: window.roomID
},


  connected: ->
    #alert data['message']
    # Called when the subscription is ready for use on the server

  disconnected: ->
    #alert data['message']
    # Called when the subscription has been terminated by the server

  received: (data) ->
    #alert data['message']
    console.log(data['room_id'])
    $('#messages').append data['message']
    #Called when there's incoming data on the websocket for this channel

  appendLine: (data) ->
    html = @createLine(data)
    console.log('huyhuyhuy')
    $("[data-chat-room='Best Room']").append(html)

  createLine: (data) ->
    """
    <article class="chat-line">
      <span class="speaker">#{data["sent_by"]}</span>
      <span class="body">#{data["body"]}</span>
    </article>
    """

  speak: (message) ->
    @perform 'speak', message: message

  $(document).on 'keypress', '#chat-speak', (event) ->
    console.log(roomID)
    if event.keyCode is 13 # return = send
      App.room.speak event.target.value,
      event.target.value = ""
      event.preventDefault()
