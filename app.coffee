
###
Module dependencies.
###
express = require("express")
routes = require("./routes")
user = require("./routes/user")
admin = require("./routes/admin")
http = require("http")
path = require("path")
socket = require("./socket")
app = express()

# all environments
app.set "port", process.env.PORT or 3000
app.set "views", __dirname + "/views"
app.set "view engine", "jade"
app.use express.favicon()
app.use express.logger("dev")
app.use express.bodyParser()
app.use express.methodOverride()
app.use app.router
app.use require('stylus').middleware({ src: __dirname + '/public' })
app.use express.static(path.join __dirname, "public")

# development only
app.use express.errorHandler()  if "development" is app.get("env")

app.get "/", routes.index
app.get "/users", user.list
app.get "/admin", admin.index

server = http.createServer(app)

socket.do server

server.listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")