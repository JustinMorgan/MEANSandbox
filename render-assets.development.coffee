express = require "express"
module.exports = app = express()

###
coffee = require "coffee-script"
fs = require "fs"
app.get '/assets/apps/:app/:script.js', (req, res) ->
  res.header 'Content-Type', 'application/x-javascript'
  cs = fs.readFileSync "/assets/apps/#{req.params.app}/#{req.params.script}.coffee", "ascii"
  js = coffee.compile cs 
  res.send js
  
sass = require 'node-sass-middleware'
app.use sass
         src: __dirname + '/assets/stylesheets'
         dest: __dirname + '/public/stylesheets'
         prefix: '/stylesheets'
         debug: on
###

BundleUp = require "bundle-up"
BundleUp app, __dirname + '/bundles',
    staticRoot: __dirname + '/public/'
    staticUrlRoot: '/'
    bundle: no
    minifyCss: no
    minifyJs: no