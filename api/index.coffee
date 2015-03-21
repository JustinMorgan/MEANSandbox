express = require "express"
router = express.Router()

router.get '/', (req, res) ->
    res.json { message: 'hello world!' }  

router.route('/ping')
    .get (req, res) ->
        res.send {ping:"PONG"}
router.route('/ping/:id')
    .get (req, res) ->
        res.json {ping: "PONG #{req.params.id}"}

schemas = require "../common/schema"
Api = require "./api-factory"

for name, schema of schemas
  router.use new Api(name, schema)

module.exports = router