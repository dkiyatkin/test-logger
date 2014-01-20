module.exports = (grunt) ->
  banner = grunt.file.read('src/logger.coffee').match(/^###\! \@license[\s\S]+?###/gim)[0].replace(/^###! @license/, '/*!').replace('###', '*/\n')
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    nodeunit: [ 'test/logger.coffee' ]
    coffee:
        compile:
          files:
            'dist/logger.min.js': 'src/logger.coffee'
    umd:
      all:
        src: 'dist/logger.min.js'
        dest: 'dist/logger.min.js'
    uglify:
      options:
        banner: banner
      my_target:
        files:
          'dist/logger.min.js': ['dist/logger.min.js']
  grunt.loadNpmTasks('grunt-contrib-nodeunit')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-umd')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.registerTask('default', ['nodeunit', 'coffee', 'umd', 'uglify'])
