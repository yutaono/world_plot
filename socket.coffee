db  = require("./db")

online_number = 0;

exports.do = (server) ->
    io = require('socket.io').listen(server)
    console.log "Hello, Hirose."

    io.sockets.on "connection", (socket) ->
        console.log 'socket connected'
        ++online_number
        socket.emit 'online_number', {online_number: online_number}
        socket.broadcast.emit 'online_number', {online_number: online_number}

        socket.on 'add user', (req) ->
            user = db.User()
            user.user_id = req.user_id
            user.created = new Date()
            user.save (err) ->
                console.log err if err

        socket.on 'disconnect', ->
            --online_number
            socket.emit 'onlineNumber', {online_number: online_number}
            socket.broadcast.emit 'onlineNumber', {online_number: online_number}
            console.log 'disconnected.'