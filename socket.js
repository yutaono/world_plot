var db, online_number;

db = require("./db");

online_number = 0;

exports["do"] = function(server) {
  var io;
  io = require('socket.io').listen(server);
  console.log("Hello, Hirose.");
  return io.sockets.on("connection", function(socket) {
    console.log('socket connected');
    ++online_number;
    socket.emit('online_number', {
      online_number: online_number
    });
    socket.broadcast.emit('online_number', {
      online_number: online_number
    });
    socket.on('add user', function(req) {
      var user;
      user = db.User();
      user.user_id = req.user_id;
      user.created = new Date();
      return user.save(function(err) {
        if (err) {
          return console.log(err);
        }
      });
    });
    return socket.on('disconnect', function() {
      --online_number;
      socket.emit('onlineNumber', {
        online_number: online_number
      });
      socket.broadcast.emit('onlineNumber', {
        online_number: online_number
      });
      return console.log('disconnected.');
    });
  });
};

/*
//@ sourceMappingURL=socket.js.map
*/