'use strict';
module.exports = function(grunt) {
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-karma');
  grunt.loadNpmTasks('grunt-coffeelint');
  grunt.loadNpmTasks('grunt-shell');
  grunt.loadNpmTasks('grunt-bumpx');

  grunt.initConfig({
      //读取配置信息
      pkg: grunt.file.readJSON('package.json'),

      clean: {build: ['utils.min.js']},

      bump: {
        options: {
          part: 'patch'
        },
        files: [ 'package.json', 'bower.json' ]
      },

      uglify: {
        options: {
          banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
        },
        utils: {
          src: 'utils.js',
          dest: 'utils.min.js'
        },
      },

      watch: {
        files: ['utils.coffee'],
        tasks: ['coffeelint']
      },

      coffeelint: {
        app: ['utils.coffee']
      },

      shell: {
        docs: {
          command: 'coffeedoc utils.coffee'
        }
      },

      karma: {
        unit: {
          configFile: 'config/karma.conf.js'
        }
      }
  });
  grunt.registerTask('docs', '文档', ['shell:docs']);
  grunt.registerTask('test', '测试', ['karma']);
  grunt.registerTask(
    'package', '打包', [
      'clean', 'bump', 'uglify'
  ]);
  grunt.registerTask('default', '默认(打包)', ['package']);
};
