'use strict'
module.exports = (grunt)->
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-concat')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-karma')
  grunt.loadNpmTasks('grunt-coffeelint')
  grunt.loadNpmTasks('grunt-shell')
  grunt.loadNpmTasks('grunt-bumpx')

  grunt.initConfig(
    #读取配置信息
    pkg: grunt.file.readJSON('package.json')

    clean:
      dist:
        'dist'

    bump:
      options:
        part: 'patch'
      files: ['package.json', 'bower.json']

    concat:
      options:
        banner: '// <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %>\n'
      utils:
        src: [
          'src/array.js'
          'src/chrome.js'
          'src/re.js'
          'src/sha1.js'
          'src/iconv.js'
          'src/gbk.js'
          'src/big5.js'
        ]
        dest: 'dist/js-utils.js'

    uglify:
      options:
        banner: '// <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %>\n'
      utils:
        src: '<%= concat.utils.src %>'
        dest: 'dist/js-utils.min.js'
      array:
        src: 'src/array.js'
        dest: 'dist/array.min.js'

    watch:
      coffee:
        files: ['src/*.coffee']
        tasks: ['coffeelint']
      js:
        files: ['src/*.js']
        tasks: ['concat']

    coffeelint:
      array: ['src/array.coffee']

    shell:
      docs:
        command: 'coffeedoc src/*.coffee'

    karma:
      options:
        configFile: 'karma.conf.js'
      dev:
        colors: true,
  )
  grunt.registerTask('docs', '文档', ['shell:docs'])
  grunt.registerTask('test', '测试', ['karma'])
  grunt.registerTask(
    'package', '打包', [
      'clean', 'bump', 'uglify'
    ])
  grunt.registerTask('default', '默认(打包)', ['package'])
