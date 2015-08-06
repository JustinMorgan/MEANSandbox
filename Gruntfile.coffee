module.exports = (grunt) ->
  grunt.initConfig
    bower_concat: 
      all: 
        dest: 'public/js/_bower.js'
        cssDest: 'public/css/_bower.css'
        mainFiles:
          'angular-ui': ['build/angular-ui.js', 'build/angular-ui.css']

  grunt.loadNpmTasks 'grunt-bower-concat'

  grunt.registerTask 'default', ['bower_concat']