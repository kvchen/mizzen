# Load plugins
gulp = require 'gulp'
bower = require 'gulp-bower'
notify = require 'gulp-notify'
rename = require 'gulp-rename'
livereload = require 'gulp-livereload'

# Style plugins
sass = require 'gulp-sass'
minifycss = require 'gulp-minify-css'

# Script plugins
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'

imagemin = require 'gulp-imagemin'
cache = require 'gulp-cache'

path = require 'path'
del = require 'del'

config = 
  public: './app/public'
  bower: './bower_components'
  styles:
    src: [
      './app/public/src/styles/**/*'
      './bower_components/fontawesome/scss/*.scss'
    ]
    dist: './app/public/dist/styles'
  scripts:
    src: [
      './app/public/src/scripts/**/*.coffee'
    ]
    dist: './app/public/dist/scripts'
  images:
    src: [
      './app/public/src/images/**/*'
    ]
    dist: './app/public/dist/images'
  fonts:
    src: [
      './bower_components/fontawesome/fonts/*'
    ]
    dist: './app/public/dist/fonts'



gulp.task 'bower', () ->
  return bower()
    .pipe gulp.dest config.bower
 

# Styles
gulp.task 'styles', () ->
  return gulp.src config.styles.src
    .pipe sass()
    .pipe minifycss()
    .pipe rename
      suffix: '.min'
    .pipe gulp.dest config.styles.dist


# Scripts
gulp.task 'scripts', () ->
  return gulp.src config.scripts.src
    .pipe coffee
      bare: true
    .pipe concat 'main.js'
    .pipe gulp.dest config.scripts.dist
    .pipe rename
      suffix: '.min'
    .pipe uglify()
    .pipe gulp.dest config.scripts.dist


# Image pipeline
gulp.task 'images', () ->
  return gulp.src config.images.src
    .pipe cache imagemin
      optimizationLevel: 3
      progressive: true
      interlaced: true
    .pipe gulp.dest config.images.dist


gulp.task 'fonts', () ->
  return gulp.src config.fonts.src
    .pipe gulp.dest config.fonts.dist


gulp.task 'ace-editor', () ->
  return gulp.src './bower_components/ace-builds/src-min/*.js'
    .pipe gulp.dest path.join config.public, 'dist/scripts/ace'


# Clean directories
gulp.task 'clean', (done) ->
  del [path.join config.public, 'dist/**'], cb


# Default task
gulp.task 'default', () ->
  gulp.start 'bower', 'styles', 'scripts', 'images', 'fonts', 'ace-editor'


