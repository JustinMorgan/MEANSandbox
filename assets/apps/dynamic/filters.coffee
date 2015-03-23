angular.module 'dynamic.filters'
  .filter 'ending', ->
    (input, size = 8, prefix = '...') ->
      if !input or input.length <= size
        input
      else
        prefix + input.substr(input.length - size + prefix.length)
  .filter 'display', ->
    (item, fieldName, displayType = 'singular') ->
      if fieldName
        item = item.fieldName
        
      if typeof item is 'string'
        return item
      else 
        return item.display?[displayType] || item.name