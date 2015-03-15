express = require("express")
router = express.Router()

router.route('/ping')
    .get (req, res) ->
        res.send {ping:"PONG"}
    
router.route('/ping/:id')
    .get (req, res) ->
        res.json {ping: "PONG #{req.params.id}"}

module.exports = router