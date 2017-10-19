App.room = App.cable.subscriptions.create('RoomChannel',
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('.messages').append data['message']
    if $('.current_user_id').attr('data-id') == data['to_user_id']
      $('.counter').html data['counter']

  speak: (message, to_user_id, room_id) ->
    @perform 'speak', message: message, to_user_id: to_user_id, room_id: room_id
)

$(document).on 'keypress', '[data-behavior=room_speaker]', (event) ->
  if event.keyCode == 13
    to_user_id = $('#to_user_id').val()
    room_id = $('#room_id').val()
    App.room.speak event.target.value, to_user_id, room_id
    event.target.value = ''
    return event.preventDefault()
