angular.module 'dynamic'
  .controller 'base', [->
  ]
  .controller 'list', ['$scope', 'items', '$state', ($scope, items, $state) ->
    $scope.items = items
    $scope.delete = (item) ->
      item.$delete ->
        $state.reload()
  ]
  .controller 'create', ['$scope', 'Item', 'goHome', ($scope, Item, goHome) ->
    item = $scope.item = new Item()
    $scope.save = ->
      item.$save goHome
  ]
  .controller 'single', ['$scope', 'item', ($scope, item) ->
    $scope.item = item
  ]
  .controller 'view', [->
  ]
  .controller 'update', ['$scope', 'item', 'goHome', ($scope, item, goHome) ->
    $scope.save = ->
      item.$update goHome
  ]