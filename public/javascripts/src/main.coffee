$ ->
    socket = io.connect(window.location.hostname)

    socket.on 'connect'

    socket.on 'online_number', (req) ->
        $('.online_number').html(req.online_number)

    $("#send").click ->
        user_id = $(".user_id").val()
        socket.emit 'add user', { user_id: user_id }
