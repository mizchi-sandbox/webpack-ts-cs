gulp = require('gulp')
webpack = require('gulp-webpack')
coffee = require 'gulp-coffee'
tsd = require 'gulp-tsd'

config =
  output:
    filename: 'all.js'
  module:
    loaders: [
      { test: /\.coffee$/, loader: "coffee" }
      # { test: /\.ts$/, loader: "typescript-loader" }
      # { test: /\.ts$/, loader: "ts-loader" }
    ]
  resolve:
    extensions: ["", ".coffee", ".ts", ".js"]

gulp.task 'coffee', ->
  gulp.src('./app/**/*.coffee')
   .pipe(coffee())
   .pipe(gulp.dest('./lib'))

gulp.task 'tsd', ->
  gulp
    .src './gulp-tsd.json'
    .pipe tsd()

gulp.task 'webpack', ->
  gulp.src('lib/initialize.js')
    .pipe(webpack(config))
    .pipe(gulp.dest('public'))

gulp.task 'watch', ['webpack'], ->
  gulp.watch 'app/**/*.coffee', ['coffee']
  gulp.watch 'lib/**/*.js', ['webpack']

gulp.task 'default', ['webpack']
