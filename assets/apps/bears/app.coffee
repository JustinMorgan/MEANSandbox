angular.module 'bears.services', ['ui.router', 'ngResource']
angular.module 'bears', ['bears.services']
  .config ['$stateProvider', '$urlRouterProvider', '$locationProvider',
  ($stateProvider, $urlRouterProvider, $locationProvider) ->
    #$locationProvider.html5Mode on
    
    $urlRouterProvider.otherwise '/'
    
    $stateProvider.state "list", 
      url: '/'
      controller: 'list'
      templateUrl: 'partials/list'
    .state "view", 
      url: '/:id'
      controller: 'view'
      templateUrl: 'partials/details'
    .state "update", 
      url: '/:id/edit'
      controller: 'update'
      templateUrl: 'partials/edit'
    .state "create", 
      url: '/create'
      controller: 'create'
      templateUrl: 'partials/edit'
    .state "delete", 
      url: '/:id/edit'
      controller: 'delete'
      templateUrl: 'partials/edit'
  ]