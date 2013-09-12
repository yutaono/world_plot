$ ->
    socket = io.connect(window.location.hostname)

    socket.on 'connect'

    socket.on 'online_number', (data) ->
        res = data.online_number
        $('.online_number').html(res)
        # console.log res