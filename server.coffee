require 'coffee-script/register'
bodyParser = require "body-parser"
express = require "express"
app = express()

config = require "./app-config"
app.set "env", config.env
app.set 'view engine', 'jade'
app.set 'views', './views'
process.env.MONGOLAB_URI = config.mongoUrl
port = config.port or process.env.PORT

app.use bodyParser.json()
app.use bodyParser.urlencoded {extended:true}

schema = require './common/schema'
app.locals.apps = (type for type of schema)

app.use (err, req, res, next) ->
    if err? then console.warn 'error', {err, req, res}
    next()
    
app.use express.static __dirname + '/public/'
app.use require("connect-assets") {
    paths: ["assets/apps", "assets/stylesheets"]
}
    
app.use '/api', require "./api"
app.use "/apps/:appName", [(req, res, next) ->
    res.locals.appName = req.params.appName
    next()
  , 
  require "./routes/apps"
]
#or:
#app.use '/apps', require './routes/route-factory'

app.get '/', (req, res) ->
  res.render 'index',
    title: 'menu'

app.listen port
console.log "app listening on port " + port
module.exports = app