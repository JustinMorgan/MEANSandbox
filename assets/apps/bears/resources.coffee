angular.module 'bears.services'
  .factory 'Api', ['$resource', ($resource) ->
    $resource '/api/:appName/:id', {id: '@_id', appName: '=appName'}, 
      update: 
        method: 'PUT'
      delete:
        method: 'DELETE'
  ]