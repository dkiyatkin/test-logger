module.exports = (grunt) ->
  banner = grunt.file.read('src/logger.coffee').match(/^###\! \@license[\s\S]+?###/gim)[0].replace(/^###! @license/, '/*!').replace('###', '*/\n')
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    nodeunit: [ 'test/logger.coffee' ]
    replace:
      dist:
        options:
          force: true,
          patterns: [
            {
              match: /module\.exports.+/,
              replacement: '',
              expression: true
            }
            {
              match: /^###\! \@license[\s\S]+?###/,
              replacement: '',
              expression: true
            }
          ]
        files: [
          {src: ['src/logger.coffee'], dest: 'build/logger.coffee'}
        ]
    coffee:
        compile:
          files:
            'build/logger.coffee.js': 'build/logger.coffee'
          options:
            bare: true
    umd:
      all:
        src: 'build/logger.coffee.js'
        dest: 'build/logger.coffee.umd.js'
        objectToExport: 'Logger'
    uglify:
      min:
        options:
          mangle:
            except: ['Logger']
          banner: banner
        files:
          'dist/logger.min.js': ['build/logger.coffee.umd.js']
    clean: ['build']
  grunt.loadNpmTasks('grunt-contrib-nodeunit')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-umd')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-replace')
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.registerTask('default', ['nodeunit', 'replace', 'coffee', 'umd', 'uglify:min', 'clean'])
