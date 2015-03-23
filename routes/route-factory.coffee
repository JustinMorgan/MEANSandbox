express = require "express"
module.exports = router = express.Router()
schema = require '../common/schema'

###
#server.coffee
app.locals.apps = (type for type in schema)

app.use "/:appName", (req, res, next) ->
  type = res.locals.appName = req.params.appName
  if type in schema
    res.locals.type = schema[type]
  next()
  
app.use "/:appName", require "./routes/route-factory"
app.get '/', (req, res) ->
  res.render 'index'

#routes/route-factory.coffee
router.route("/")
  .get (req, res) ->
    console.log 'index params', req.params
    console.log 'index locals', res.locals
    res.render 'app'
    
router.route("/partials/:view")
  .all (req, res) ->
    #.get (req, res) ->
    console.log 'partials params', req.params
    console.log 'partials locals', res.locals
    #res.render 'partials/' + req.params.view
###

#------------
names = []
for name, type of schema
  names.push name
  #"freeze" name and type, but not names
  do (name = name, type = type) ->
    router.route("/#{name}")
      .get (req, res) ->
        res.render 'app', 
          appName: name
          apps: names
    router.route("/#{name}/partials/:view")
      .get (req, res) ->
        res.render "partials/#{req.params.view}", 
          appName: name
          type: type
          apps: names
        
router.get '/', (req, res) -> 
  res.render 'index', 
    title: 'menu'
    apps: names
