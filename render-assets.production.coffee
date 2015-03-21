express = require "express"
module.exports = app = express()

BundleUp = require "bundle-up"
BundleUp app, __dirname + '/bundles',
    staticRoot: __dirname + '/public/'
    staticUrlRoot: '/'
    bundle: yes
    minifyCss: yes
    minifyJs: yes