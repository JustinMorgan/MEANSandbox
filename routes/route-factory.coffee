express = require "express"
module.exports = router = express.Router()
schema = require '../common/schema'

apps = for appName, type of schema
  #"freeze" appName and type for when the callbacks fire
  do (appName = appName, type = type) ->
    #router.route appName
    router.route "/#{appName}"
      .get (req, res) ->
        res.render 'app', 
          {appName, type, apps}
    
    #router.route appName + '/partials/:view'
    router.route "/#{appName}/partials/:view"
      .get (req, res) ->
        res.render 'partials/' + req.params.view, 
          {appName, type}
        
  appName
        
router.get '/', (req, res) -> 
  res.render 'index', 
    appName: 'menu'
    apps: apps