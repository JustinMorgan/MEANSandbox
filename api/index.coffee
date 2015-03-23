express = require "express"
module.exports = router = express.Router()

router.get '/', (req, res) ->
    res.json { message: 'hello world!' }  

router.route('/ping')
    .get (req, res) ->
        res.send {ping:"PONG"}
router.route('/ping/:id')
    .get (req, res) ->
        res.json {ping: "PONG #{req.params.id}"}

schema = require "../common/schema"
Api = require "./api-factory"

for name, type of schema
  router.use new Api(name, type)