gulp = require 'gulp'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
clean = require 'gulp-clean'
KarmaServer = require('karma').Server

gulp.task('clean', (cb)->
  del 'dist', cb
)

gulp.task('coffee', (cb)->
  gulp.src([
    'src/utils.coffee'
    'src/array.coffee'
    'src/helper.coffee'
    'src/set.coffee'
    'src/math.coffee'
    'src/ic.coffee'
  ])
    .pipe(coffee({bare:true}))
    .pipe(concat('utils.min.js'))
    .pipe(uglify())
    .pipe(gulp.dest('dist'))
    .on('finish', cb)
)

gulp.task('watch', (bc)->
  gulp.watch('src/**/*.coffee', gulp.series('coffee'))
  new KarmaServer(
    configFile: __dirname + '/karma.conf.js'
  , bc).start()
)

gulp.task('test', (bc)->
  new KarmaServer(
    configFile: "#{__dirname}/karma.conf.js"
    singleRun: true
  , bc).start()
)
gulp.task('build', gulp.series(
  'coffee'
))

gulp.task('default', gulp.series(
  'build'
))
