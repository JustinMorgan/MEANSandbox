angular.module 'bears.services'
  .factory 'Bear', ['$resource', ($resource) ->
    $resource '/api/bears/:id', {id: '@_id'}, 
      update: 
        method: 'PUT'
      delete:
        method: 'DELETE'
  ]