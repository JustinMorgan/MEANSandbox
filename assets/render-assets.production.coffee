express = require "express"
app = express()
router = module.exports = express.Router()

BundleUp = require "bundle-up"
BundleUp app, __dirname, 
    staticRoot: __dirname + "/../public/"
    staticUrlRoot: '/'
    bundle: no
    minifyCss: no
    minifyJs: no