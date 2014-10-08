gulp = require('gulp')
webpack = require('gulp-webpack')

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

gulp.task 'webpack', ->
  gulp.src('app/initialize.coffee')
    .pipe(webpack(config))
    .pipe(gulp.dest('public/'))

gulp.task 'watch', ['webpack'], ->
  gulp.watch 'app/**/*.coffee', ['webpack']

gulp.task 'default', ['webpack']
