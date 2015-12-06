gulp = require 'gulp'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
clean = require 'gulp-clean'
KarmaServer = require('karma').Server

gulp.task('clean', ->
  gulp.src([
    'dist'
  ], {read: false})
    .pipe(clean())
)

gulp.task('coffee', ->
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
)

gulp.task('watch', (bc)->
  gulp.watch('src/**/*.coffee', ['coffee'])
  #new KarmaServer(
  #  configFile: __dirname + '/karma.conf.js'
  #, bc).start()
)

gulp.task('test', (bc)->
  new KarmaServer(
    configFile: "#{__dirname}/karma.conf.js"
    singleRun: true
  , bc).start()
)
gulp.task('build', [
  'coffee'
])

gulp.task('default',['build'])
