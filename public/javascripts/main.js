$(function() {
  var socket;
  socket = io.connect(window.location.hostname);
  socket.on('connect');
  socket.on('online_number', function(req) {
    return $('.online_number').html(req.online_number);
  });
  return $("#send").click(function() {
    var user_id;
    user_id = $(".user_id").val();
    return socket.emit('add user', {
      user_id: user_id
    });
  });
});

/*
//@ sourceMappingURL=main.js.map
*/