angular.module 'bears.services', ['ui.router', 'ngResource']
angular.module 'bears.directives', []
angular.module 'bears.filters', []
angular.module 'bears', ['bears.filters', 'bears.directives', 'bears.services']
  .config ['$stateProvider', '$urlRouterProvider', '$locationProvider',
  ($stateProvider, $urlRouterProvider, $locationProvider) ->
    $locationProvider.html5Mode on
    
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
  ]