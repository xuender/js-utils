module.exports = (grunt)->
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-concat')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-karma')
  grunt.loadNpmTasks('grunt-coffeelint')
  grunt.loadNpmTasks('grunt-shell')
  grunt.loadNpmTasks('grunt-bumpx')

  grunt.initConfig(
    pkg: grunt.file.readJSON('package.json')

    clean:
      dist: ['dist', 'docs']

    bump:
      options:
        part: 'patch'
      files: ['package.json', 'bower.json']

    coffee:
      options:
        banner: '// <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %>\n'
        bare: true
      array:
        files:
          'dist/array.js': 'src/array.coffee'
      re:
        files:
          'dist/re.js': 'src/re.coffee'
      chrome:
        files:
          'dist/chrome.js': [
            'src/html5.coffee'
            'src/chrome.coffee'
          ]
      iconv:
        files:
          'dist/iconv.js': [
            'src/gbk.coffee'
            'src/big5.coffee'
            'src/iconv.coffee'
          ]
      utils:
        files:
          'dist/js-utils.js': [
            'src/array.coffee'
            'src/chrome.coffee'
            'src/re.coffee'
            'src/iconv.coffee'
            'src/gbk.coffee'
            'src/big5.coffee'
          ]

    uglify:
      options:
        banner: '// <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %>\n'
      array:
        files:
          'dist/array.min.js': 'dist/array.js'
      re:
        files:
          'dist/re.min.js': 'dist/re.js'
      chrome:
        files:
          'dist/chrome.min.js': 'dist/chrome.js'
      iconv:
        files:
          'dist/iconv.min.js': 'dist/iconv.js'
      utils:
        files:
          'dist/js-utils.min.js': [
            'lib/sha1.js'
            'dist/js-utils.js'
          ]

    watch:
      coffee:
        files: ['src/*.coffee']
        tasks: ['coffeelint']

    coffeelint:
      array: ['src/*.coffee']

    shell:
      docs:
        command: 'coffeedoc src/*.coffee'

    karma:
      options:
        configFile: 'karma.conf.js'
      dev:
        colors: true,
      travis:
        singleRun: true
        autoWatch: false
  )
  grunt.registerTask('docs', 'create docs', ['shell:docs'])
  grunt.registerTask('test', 'watch run test', ['karma:dev'])
  grunt.registerTask('travis', 'travis test', ['clean', 'concat', 'karma:travis'])
  grunt.registerTask(
    'dist', '生成', [
      'clean'
      'bump'
      'coffee'
      'uglify'
    ])
  grunt.registerTask('default', '默认', ['dist'])
