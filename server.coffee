require 'coffee-script/register'
bodyParser = require "body-parser"
express = require "express"
app = module.exports = express()

for key, val of require "./env.config"
    app.set key, val

app.use bodyParser.json()
app.use bodyParser.urlencoded {extended:true}

app.use (err, req, res, next) ->
    if err? then console.warn 'error', {err, req, res}
    next()

app.use '/api', require "./api"
app.use '/assets', require "./assets"
routes = require "./routes"
 
app.use express.static __dirname + '/public/'

app.set 'view engine', 'jade'
app.set 'views', './views'
app.get '/', routes.index
app.get '/partials/:name', (req, res) ->
    res.render "partials/" + req.params.name

port = process.env.PORT
app.listen port
console.log "Listening on port " + port
