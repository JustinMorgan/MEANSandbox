express = require "express"
app = express()
router = module.exports = express.Router()

coffee = require "coffee-script"
fs = require "fs"
router.get '/apps/:app/:script.js', (req, res) ->
  res.header 'Content-Type', 'application/x-javascript'
  cs = fs.readFileSync "#{__dirname}/apps/#{req.params.app}/#{req.params.script}.coffee", "ascii"
  js = coffee.compile cs 
  res.send js