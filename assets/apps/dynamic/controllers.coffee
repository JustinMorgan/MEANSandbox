angular.module 'dynamic'
  .controller 'base', ['$scope', 'schema', ($scope, schema) ->
    $scope.schema = schema
  ]
  .controller 'list', ['$scope', 'items', '$state', ($scope, items, $state) ->
    $scope.items = items
    $scope.delete = (item) ->
      item.$delete ->
        $state.reload()
  ]
  .controller 'create', ['$scope', 'Item', '$state', ($scope, Item, $state) ->
    $scope.item = new Item()
    $scope.save = ->
      $scope.item.$save -> 
        $state.go 'list'
  ]
  .controller 'single', ['$scope', 'item', ($scope, item) ->
    $scope.item = item
  ]
  .controller 'view', [->]
  .controller 'update', ['$scope', 'item', '$state', ($scope, item, $state) ->
    $scope.save = ->
      item.$update -> 
        $state.go 'list'
  ]