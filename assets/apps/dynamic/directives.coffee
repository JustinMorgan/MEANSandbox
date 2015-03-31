angular.module 'dynamic.directives'
  .directive 'annotate',  ->
    link: (scope, element, attrs) ->
      field = scope.field
      #edit, display, etc.
      for annotationGroup in attrs.annotate.split(' ')
        annotations = field[annotationGroup]
        if annotations? 
          element.attr(key, value) for key, value of annotations
      return