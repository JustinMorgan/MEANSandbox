express = require "express"
app = express()
router = module.exports = express.Router()

if app.get("env") is "development"
  coffee = require "coffee-script"
  fs = require "fs"
  router.get '/:app/:script.js', (req, res) ->
    res.header 'Content-Type', 'application/x-javascript'
    cs = fs.readFileSync "#{__dirname}/#{req.params.app}/#{req.params.script}.coffee", "ascii"
    js = coffee.compile cs 
    res.send js
else
  #todo:test
  app.use require('coffee-middleware') src: "#{__dirname}"
  app.use require("serve-static") "#{__dirname}"
  router.get '/bears/:script', (req, res) ->
    res.render './bears/' + req.params.script