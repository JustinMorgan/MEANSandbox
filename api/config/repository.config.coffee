module.exports = (repository) ->
    #todo: let the model handle its own mapping and registration?
    bear = require "../models/bear"
    repository.register 'bear', bear