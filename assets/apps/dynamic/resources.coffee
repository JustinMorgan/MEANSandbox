angular.module 'dynamic.services'
  .factory 'ApiResource', ['$resource', ($resource) ->
    (appName) ->
      $resource "/api/:appName/:id", {id: '@_id', appName}, 
        update: 
          method: 'PUT'
        delete:
          method: 'DELETE'
        schema: 
          url: "/api/:appName/schema"
          params: {appName}
  ]