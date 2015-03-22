angular.module 'dynamic.services', ['ui.router', 'ngResource']
angular.module 'dynamic.directives', []
angular.module 'dynamic.filters', []
angular.module 'dynamic', ['dynamic.filters', 'dynamic.directives', 'dynamic.services']
  .config ['$stateProvider', '$urlRouterProvider', '$locationProvider',
  ($stateProvider, $urlRouterProvider, $locationProvider) ->
    $locationProvider.html5Mode on
    
    #$urlRouterProvider.otherwise '/'
    
    #TODO: For some reason, http://foo.com/bar is fine, but http://foo.com/bar/ makes everything go haywire.
    #Either fix this, redirect to a default, or strip trailing slashes.
    $stateProvider.state "base",
      controller: 'base'
      url: '/{appName:[^/]*}'
      abstract: yes
      template: '<ui-view/>'
      resolve:
        appName: ($stateParams) -> $stateParams.appName
        Item: (ApiResource, appName) ->
          return ApiResource appName 
    .state "list", 
      controller: 'list'
      parent: 'base'
      url: ''
      templateUrl: 'dynamic/list'
      resolve: 
        items: (Item) ->
          return Item.query().$promise
    .state "create", 
      controller: 'create'
      parent: 'base'
      url: '/create'
      templateUrl: 'dynamic/edit'
    .state "single",
      controller: 'single'
      parent: 'base'
      url: '/{id:[0-9a-fA-F]{24}}'
      abstract: yes
      template: '<ui-view/>'
      resolve:
        item: (Item, appName, $stateParams, $state) ->
          id = $stateParams.id
          Item.get({id}).$promise
    .state "view", 
      controller: 'view'
      parent: 'single'
      url: ''
      templateUrl: 'dynamic/details'
    .state "update", 
      controller: 'update'
      parent: 'single'
      url: '/edit'
      templateUrl: 'dynamic/edit'
  ]
  .run ['$rootScope', ($rootScope) ->
        $rootScope.$on '$stateChangeSuccess', (ev, to, toParams, from) ->
            $rootScope.appName = toParams.appName
  ]