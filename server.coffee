require 'coffee-script/register'
bodyParser = require "body-parser"
express = require "express"
app = express()

config = require "./config"
app.set "env", config.env
process.env.MONGOLAB_URI = config.mongoUrl

app.use bodyParser.json()
app.use bodyParser.urlencoded {extended:true}

app.use (err, req, res, next) ->
    if err? then console.warn 'error', {err, req, res}
    next()
    
app.use '/api', require "./api"
app.use require("connect-assets") {
    paths: ["assets/apps", "assets/stylesheets"]
}
    
app.use express.static __dirname + '/public/'

app.set 'view engine', 'jade'
app.set 'views', './views'
app.use '/', require './routes/route-factory'
app.get '/partials/:name', (req, res) ->
    res.render "partials/" + req.params.name
    
app.get '*', (req, res) -> res.redirect '/'
#app.get '*', (req, res) -> res.redirect '/bears'

port = process.env.PORT
app.listen port
console.log "app listening on port " + port
module.exports = app