module.exports = (repository) ->
    bear = require "../models/bear"
    repository.register 'bear', bear