angular.module 'dynamic.filters'
  .filter 'ending', ->
    (input, size = 8, prefix = '...') ->
      if !input or input.length <= size
        input
      else
        prefix + input.substr(input.length - size + prefix.length)