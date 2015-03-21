angular.module 'bears'
  .controller 'list', ['$state', '$scope', 'Api', ($state, $scope, Api) ->
    $scope.bears = Api.query {appName:'bear'}
    $scope.delete = (bear) ->
      bear.$delete {appName:'bear'}, -> 
        $state.reload()
  ]
  .controller 'single', ['$state', '$scope', 'Api', ($state, $scope, Api) ->
    $scope.bear = Api.get {id: $state.params.id, appName: 'bear'}
    $scope.save = ->
      $scope.bear.$update {appName:'bear'}, ->
        $state.go 'list'
  ]
  .controller 'view', [->]
  .controller 'update', [->]
  .controller 'create', ['$state', '$scope', 'Api', ($state, $scope, Api) ->
    $scope.bear = new Api {appName:'bear'}
    $scope.save = ->
      $scope.bear.$save {appName:'bear'}, ->
        $state.go 'list'
  ]