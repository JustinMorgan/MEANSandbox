angular.module 'bears'
  .controller 'list', ['$state', '$scope', 'Bear', ($state, $scope, Bear) ->
    $scope.bears = Bear.query()
    $scope.delete = (bear) ->
      bear.$delete -> 
        $state.reload()
  ]
  .controller 'view', ['$state', '$scope', 'Bear', ($state, $scope, Bear) ->
    $scope.bear = Bear.get id: $state.params.id
  ]
  .controller 'update', ['$state', '$scope', 'Bear', ($state, $scope, Bear) ->
    $scope.bear = Bear.get id: $state.params.id
    $scope.save = ->
      $scope.bear.$update -> 
        $state.go 'list'
  ]
  .controller 'create', ['$state', '$scope', 'Bear', ($state, $scope, Bear) ->
    $scope.bear = new Bear()
    $scope.save = ->
      $scope.bear.$save -> 
        $state.go 'list'
  ]