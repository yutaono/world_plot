
#
# * GET users listing.
#

db = require("../db")

exports.list = (req, res) ->
  db.User.find (err, docs) ->
    console.log err if err
    res.send docs
