angular.module 'dynamic.services'
  .factory 'ApiResource', ['$resource', ($resource) ->
    (appName) ->
      $resource "/api/#{appName}/:id", {id: '@_id'}, 
        update: 
          method: 'PUT'
        delete:
          method: 'DELETE'
  ]