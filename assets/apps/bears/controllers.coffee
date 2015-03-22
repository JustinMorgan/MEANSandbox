angular.module 'bears'
  .controller 'list', ['$state', '$scope', 'Bear', ($state, $scope, Bear) ->
    $scope.bears = Bear.query()
    $scope.state = $state
    $scope.delete = (bear) ->
      bear.$delete -> 
        $state.reload()
  ]
  .controller 'single', ['$state', '$scope', 'Bear', ($state, $scope, Bear) ->
    $scope.bear = Bear.get {id: $state.params.id}
    $scope.state = $state
    $scope.save = ->
      $scope.bear.$update ->
        $state.go 'list'
  ]
  .controller 'view', [->]
  .controller 'update', [->]
  .controller 'create', ['$state', '$scope', 'Bear', ($state, $scope, Bear) ->
    $scope.bear = new Bear()
    $scope.save = ->
      $scope.bear.$save ->
        $state.go 'list'
  ]