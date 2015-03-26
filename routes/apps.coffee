express = require "express"
app = express()
module.exports = router = express.Router(mergeParams: on)

router.route '/partials/:view'
  .get (req, res) ->
    res.render 'partials/' + req.params.view

router.route "*" 
  .get (req, res) ->
    res.render 'app'