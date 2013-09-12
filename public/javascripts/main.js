$(function() {
  var socket;
  socket = io.connect(window.location.hostname);
  socket.on('connect');
  return socket.on('online_number', function(data) {
    var res;
    res = data.online_number;
    return $('.online_number').html(res);
  });
});

/*
//@ sourceMappingURL=main.js.map
*/