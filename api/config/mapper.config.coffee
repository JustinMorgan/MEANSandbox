module.exports = (mapper) ->
  mapper.register 'bear',
    toModel: (data, entity) ->
      entity.name = data.name
      entity
    fromModel: (entity, data) ->
      if data
        data.name = entity.name
        data._id = entity._id
        return data
      entity