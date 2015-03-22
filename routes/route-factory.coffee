express = require "express"
module.exports = router = express.Router()
schema = require '../common/schema'

names = for name, type of schema
  #snapshot the values so they don't change during iteration,
  #otherwise the callback to router.get will reference the wrong values]
  do (name = name, type = type) ->
    router.get '/' + name, (req, res) ->
      res.render 'index', 
        title: name
        appName: name
        modelMap: type
  name
        
router.get '/', (req, res) -> 
  res.render 'menu',
    apps: names
    