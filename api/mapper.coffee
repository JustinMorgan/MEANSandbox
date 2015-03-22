module.exports = (type) ->
    map: (source) ->
        to: (target) ->
            for field in type
                name = field.fieldName
                target[name] = source[name]
            target
    schema: do ->
        s = {}
        for field in type
            s[field.fieldName] = switch field.dataType
                when "date", "time", "datetime", "datetime-local" then Date
                when "checkbox" then Boolean
                when "number" then Number
                else String
        s
            
        