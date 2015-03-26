require 'coffee-script/register'
bodyParser = require "body-parser"
express = require "express"
app = express()

config = require "./config"
app.set "env", config.env
process.env.MONGOLAB_URI = config.mongoUrl
port = config.port or process.env.PORT

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

schema = require './common/schema'
app.locals.apps = (type for type of schema)

app.use "/apps/:appName", [(req, res, next) ->
    appName = req.params.appName
    if schema.hasOwnProperty appName
      type = schema[appName]
    res.locals = {appName, type}
    next()
  , 
  require "./routes/apps"
]
#or
app.use '/apps', require './routes/route-factory'

app.get '/', (req, res) ->
  res.render 'index',
    title: 'menu'

app.listen port
console.log "app listening on port " + port
module.exports = app