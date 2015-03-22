module.exports = (schema) ->
    (source) ->
        to: (target) ->
            for field of schema
                target[field] = source[field]
            target