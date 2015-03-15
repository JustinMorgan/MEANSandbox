require 'coffee-script/register'

express = require "express"
bodyParser = require "body-parser"
port = process.env.PORT
app = express()

app.set 'view engine', 'jade'
app.set 'views', './views'
app.use bodyParser.json()
app.use bodyParser.urlencoded {extended:true}

app.use (err, req, res, next) ->
    console.warn 'error', {err:err, req:req, res:res}
    next()

app.get '/', (req, res) ->
    res.render 'index', {title:'express'}

app.use '/api', require "./api"

app.listen port
console.log "Listening on port #{port}"
