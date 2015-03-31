angular.module 'dynamic.services', ['ui.router', 'ngResource']
angular.module 'dynamic.directives', []
angular.module 'dynamic.filters', []
angular.module 'dynamic', ['dynamic.filters', 'dynamic.directives', 'dynamic.services']
  .config ['$stateProvider', '$urlRouterProvider', '$locationProvider',
  ($stateProvider, $urlRouterProvider, $locationProvider) ->
    $locationProvider.html5Mode on
    
    $urlRouterProvider.otherwise '/'
    
    #TODO: For some reason, http://foo.com/bar is fine, but http://foo.com/bar/ makes everything go haywire.
    #Either fix this, redirect to a default, or strip trailing slashes.
    $stateProvider.state "base",
      controller: 'base'
      url: '/{appName:[^/]*}'
      abstract: yes
      template: '<ui-view/>'
      resolve:
        appName: ['$stateParams', ($stateParams) -> $stateParams.appName]
        Item: ['ApiResource', 'appName', (ApiResource, appName) -> new ApiResource appName]
        schema: ['Item', (Item) -> Item.schema().$promise]
        
    .state "list", 
      controller: 'list'
      parent: 'base'
      url: ''
      templateUrl: (appName) -> appName + '/partials/list'
      resolve: 
        items: ['Item', (Item) -> Item.query().$promise]
        
    .state "create", 
      controller: 'create'
      parent: 'base'
      url: '/create'
      templateUrl: (appName) -> appName + '/partials/edit'
        
    .state "single",
      controller: 'single'
      parent: 'base'
      url: '/{id:[0-9a-fA-F]{24}}'
      abstract: yes
      template: '<ui-view/>'
      resolve:
        item: ['Item', '$stateParams', (Item, $stateParams) ->
            id = $stateParams.id
            Item.get({id}).$promise
        ]
        
    .state "view", 
      controller: 'view'
      parent: 'single'
      url: ''
      templateUrl: (appName) -> appName + '/partials/details'
      
    .state "update", 
      controller: 'update'
      parent: 'single'
      url: '/edit'
      templateUrl: (appName) -> appName + '/partials/edit'
  ]
  .run ['$rootScope', ($rootScope) ->
        $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
            toParams.appName ?= fromParams.appName
            $rootScope.appName = toParams.appName
            #todo: if changing apps, reload everything
  ]