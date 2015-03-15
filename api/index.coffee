express = require "express"
router = express.Router()

require "../config"

router.get '/', (req, res) ->
    res.json { message: 'hello world!' }  

router.use require("./ping")

mapper = require "../common/mapper"
apiBuilder = require "../common/apiBuilder"

router.use apiBuilder('bear', mapper)

module.exports = router