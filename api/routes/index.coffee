express = require "express"
router = express.Router()

router.get '/', (req, res) ->
    res.json { message: 'hello world!' }  

router.use require "./ping"
router.use require "./bear"

module.exports = router