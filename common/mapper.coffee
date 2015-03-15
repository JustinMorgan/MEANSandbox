_toModel = {}
_fromModel = {}

#function wrappers are for late binding
mapper = (type) ->
    toModel: (source, target) -> _toModel[type] source, target
    fromModel: (source, target) -> _fromModel[type] source, target
    
mapper.register = (type, callbacks) ->
    _toModel[type] = callbacks.toModel
    _fromModel[type] = callbacks.fromModel
    mapper
    
mapper.configure = (callback) ->
    callback mapper
    mapper

module.exports = mapper