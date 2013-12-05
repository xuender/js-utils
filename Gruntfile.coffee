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
    pkg: grunt.file.readJSON('package.json')

    clean:
      dist: ['dist', 'docs']

    bump:
      options:
        part: 'patch'
      files: ['package.json', 'bower.json']

    concat:
      options:
        banner: '// <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %>\n'
      array:
        src:'src/array.js'
        dest: 'dist/array.js'
      re:
        src:'src/re.js'
        dest: 'dist/re.js'
      chrome:
        src:[
          'src/html5.js'
          'src/chrome.js'
        ]
        dest: 'dist/chrome.js'
      iconv:
        src: [
          'src/gbk.js'
          'src/big5.js'
          'src/iconv.js'
        ]
        dest: 'dist/iconv.js'
      utils:
        src: [
          'lib/sha1.js'
          'src/array.js'
          'src/chrome.js'
          'src/re.js'
          'src/iconv.js'
          'src/gbk.js'
          'src/big5.js'
        ]
        dest: 'dist/js-utils.js'

    uglify:
      options:
        banner: '// <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %>\n'
      iconv:
        src: '<%= concat.iconv.src %>'
        dest: 'dist/iconv.min.js'
      chrome:
        src: '<%= concat.chrome.src %>'
        dest: 'dist/chrome.min.js'
      re:
        src: 'src/re.js'
        dest: 'dist/re.min.js'
      array:
        src: 'src/array.js'
        dest: 'dist/array.min.js'
      utils:
        src: '<%= concat.utils.src %>'
        dest: 'dist/js-utils.min.js'

    watch:
      js:
        files: ['src/*.js']
        tasks: ['concat']

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
    'dist', 'default', [
      'coffeelint', 'clean', 'bump', 'uglify'
    ])
  grunt.registerTask('default', 'dist', ['dist'])
