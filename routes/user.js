var db;

db = require("../db");

exports.list = function(req, res) {
  return db.User.find(function(err, docs) {
    if (err) {
      console.log(err);
    }
    return res.send(docs);
  });
};

/*
//@ sourceMappingURL=user.js.map
*/