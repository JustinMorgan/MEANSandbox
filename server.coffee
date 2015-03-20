require 'coffee-script/register'
bodyParser = require "body-parser"
express = require "express"
app = module.exports = express()

for key, val of require "./env.config"
    app.set key, val

process.env.NODE_ENV = app.get "env"

app.use bodyParser.json()
app.use bodyParser.urlencoded {extended:true}

app.use (err, req, res, next) ->
    if err? then console.warn 'error', {err, req, res}
    next()

app.use '/api', require "./api"
app.use '/assets', require "./assets"

sass = require 'node-sass-middleware'
app.use sass
         src: __dirname + '/assets/stylesheets'
         dest: __dirname + '/public/stylesheets'
         prefix: '/stylesheets'
         debug: on
 
app.use express.static __dirname + '/public/'

app.set 'view engine', 'jade'
app.set 'views', './views'
app.get '/partials/:name', (req, res) ->
    res.render "partials/" + req.params.name
    
app.get '*', require("./routes").index

port = process.env.PORT
app.listen port
console.log "Listening on port " + port
