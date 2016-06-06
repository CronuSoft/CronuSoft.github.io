#global module:false

"use strict"

module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)

  grunt.initConfig

    copy:
      jquery:
        files: [{
          expand: true
          cwd: "bower_components/jquery/dist/"
          src: "jquery.min.js"
          dest: "vendor/js/"
        }]
      "jquery-migrate":
        files: [{
          expand: true
          cwd: "bower_components/jquery-migrate/"
          src: "jquery-migrate.min.js"
          dest: "vendor/js/"
        }]
      "jquery.scrollTo":
        files: [{
          expand: true
          cwd: "bower_components/jquery.scrollTo"
          src: "jquery.scrollTo.min.js"
          dest: "vendor/js/"
        }]
      "jquery.easing":
        files: [{
          expand: true
          cwd: "bower_components/jquery.easing/js"
          src: "jquery.easing.min.js"
          dest: "vendor/js/"
        }]
      prism:
        files: [{
          expand: true
          cwd: "bower_components/prism/"
          src: "prism.js"
          dest: "vendor/js/"
        },
        {
          expand: true
          cwd: "bower_components/prism/themes"
          src: "prism.css"
          dest: "vendor/css/"
        }]
      "font-awesome":
        files: [{
          expand: true
          cwd: "bower_components/font-awesome/css/"
          src: "font-awesome.min.css"
          dest: "vendor/css/"
        },
        {
          expand: true
          cwd: "bower_components/font-awesome/fonts/"
          src: "*"
          dest: "vendor/fonts/"
        }]
      bootstrap:
        files: [{
          expand: true
          cwd: "bower_components/bootstrap/dist/css/"
          src: "bootstrap.min.css"
          dest: "vendor/css/"
        },
        {
          expand: true
          cwd: "bower_components/bootstrap/dist/js/"
          src: "bootstrap.min.js"
          dest: "vendor/js/"
        }]

    exec:
      jekyll:
        cmd: "bundle exec jekyll build --trace"

    less:
      dev:
        options:
          paths: ["_less"]
        files:
          "css/styles.css": "_less/styles.less"

    watch:
      options:
        livereload: true
      source:
        files: [
          "_drafts/**/*"
          "_includes/**/*"
          "_layouts/**/*"
          "_posts/**/*"
          "_team_members/**/*"
          "_less/**/*"
          "css/**/*"
          "js/**/*"
          "_config.yml"
          "*.html"
          "*.md"
        ]
        tasks: [
          "less:dev"
          "exec:jekyll"
        ]

    connect:
      server:
        options:
          port: 4000
          base: '_site'
          livereload: true

    open:
      dev:
        path: "http://localhost:4000"

  grunt.registerTask "build", [
    "copy"
    "less"
    "exec:jekyll"
  ]

  grunt.registerTask "serve", [
    "build"
    "connect:server"
    "open:dev"
    "watch"
  ]

  grunt.registerTask "default", [
    "serve"
  ]
