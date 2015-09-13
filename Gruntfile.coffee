module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-browserify'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-haml'
  grunt.loadNpmTasks 'grunt-contrib-jasmine'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-sass')
  
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    watch:
      rime:
        files: 'src/javascripts/Elise.coffee'
        tasks: ['browserify']
      tests:
        files: [{
          'spec/src/jasmine_helpers/**/*.coffee'
          'spec/src/app/**/*Spec.coffee'
        }]
        tasks: ['coffee:compileTests','browserify:jasmineHelpers']

    coffee:
      compile:
        expand: true
        flatten: true
        cwd: "#{__dirname}/src/"
        src: ['*.coffee']
        dest: 'js/'
        ext: '.js'
      compileTests:
        files:
          'public_html/javascripts/appSpec.js': 'test/src/**/*spec.coffee'
      compileRoutes:
        options:
          join: true
        files:
          'public_html/javascripts/routes.js': [
            'src/javascripts/routes/partials/init.coffee',
            'src/javascripts/routes/*.coffee',
            'src/javascripts/routes/partials/pushstate.coffee'
          ]
    
    haml:
      index:
        files: 'public_html/index.html': 'src/templates/index.haml'
      templates:
        files: grunt.file.expandMapping(['src/templates/partials/**/*.haml'], 'public_html/js/templates/', {
          rename: (base, path) -> 
            path = path.replace('src\/templates\/Partials\/','')
            return base + path.replace(/\.haml$/, '.html.js')
        })
    
    sass:
      dist:
        files: {
          'public_html/stylesheets/app.css': 'src/stylesheets/app.sass'
        }
    
    concat:
      expect:
        src: ['node_modules/expect.js/index.js','spec/appSpec.js']
        dest: 'spec/appSpec.js'
      libraries:
        src: ['node_modules/jquery/dist/jquery.min.js','node_modules/underscore/underscore-min.js','node_modules/backbone/backbone-min.js']
        dest: 'public_html/javascripts/lib.js'
        
    browserify:
      dist:
        options:
          transform: ['coffeeify']
        files: 
          'public_html/javascripts/elise.js': 'src/javascripts/Elise.coffee'
                
      jasmineHelpers:
        options:
          transform: ['coffeeify']
        files: [{
          expand: true
          cwd: 'spec/src/jasmine_helpers'
          src: ['{,*/}*.coffee']
          dest: 'spec/helpers'
          rename: (dest, src) ->
            return dest + '/' + src.replace(/\.coffee$/, '.js')
        }]
        
    jasmine:
      src: 'public_html/javascripts/*/*.js'
      options:
        keepRunner: false
        outfile: '_SpecRunner.html'
        vendor: 'node_modules/expect.js/index.js'
        specs: 'spec/**/*Spec.js'
        host: 'http://localhost:3000'
        template: 'test/jasmine/template.html'
        display: 'full'
    
    connect:
      server:
        options:
          port: 3000
          base: ''
          
    copy:
      deploy:
        files: [
          {expand: true, src: ['js/**'], dest: 'public_html/'},
          {expand: true, cwd: 'src/', src: ['images/**'], dest: 'public_html/'}
        ]
  
  grunt.registerTask('watchApp', ['watch:rime', 'watch:tests'])
  grunt.registerTask('test', ['connect','jasmine'])
  grunt.registerTask('compile', [
    'browserify', 
    'browserify:jasmineHelpers', 
    'coffee:compileTests', 
    'concat:libraries',
    'coffee:compileRoutes',
    'haml:templates',
    'sass'])
  grunt.registerTask('deploy', ['compile','haml:index'])
  
  return
