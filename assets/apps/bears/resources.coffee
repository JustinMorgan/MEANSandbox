angular.module 'bears.services'
  .factory 'Bear', ['$resource', ($resource) ->
    $resource '/api/bear/:id', {id: '@_id'}, 
      update: 
        method: 'PUT'
      delete:
        method: 'DELETE'
  ]