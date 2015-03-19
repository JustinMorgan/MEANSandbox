express = require "express"
app = module.exports = express()

app.use '/apps', require "./apps"

if app.get("env") is "development"
  sass = require "node-sass-middleware"
  app.use sass 
          src: __dirname + '/stylesheets'
          dest: __dirname + '/stylesheets'
          debug: on
          outputStyle: 'expanded'
  
else
  BundleUp = require "bundle-up"
  
  BundleUp app, __dirname, 
      staticRoot: __dirname + "/../public/"
      staticUrlRoot: '/'
      bundle: no
      minifyCss: no
      minifyJs: no