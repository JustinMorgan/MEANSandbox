angular.module 'dynamic'
  .controller 'base', [->
  ]
  .controller 'list', ['$state', '$scope', 'items', ($state, $scope, items) ->
    $scope.items = items
    $scope.delete = (item) =>
      item.$delete => 
        $state.reload()
  ]
  .controller 'create', ['$state', '$scope', 'Item', 'appName', ($state, $scope, Item, appName) ->
    item = $scope.item = new Item()
    $scope.save = =>
      item.$save =>
        $state.go 'list', {appName}
  ]
  .controller 'single', ['$scope', 'item', ($scope, item) ->
    $scope.item = item
  ]
  .controller 'view', [->
  ]
  .controller 'update', ['$state', '$scope', 'appName', ($state, $scope, appName) ->
    $scope.save = =>
      $scope.$parent.item.$update =>
        $state.go 'list', {appName}
  ]