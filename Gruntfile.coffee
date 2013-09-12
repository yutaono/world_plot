module.exports = (grunt)->
    grunt.initConfig
        pkg: "<json:package.json>"
        coffee:
            app:
                files:
                    "app.js": "app.coffee"
                    "routes/index.js": "routes/src/index.coffee"
                    "routes/user.js": "routes/src/user.coffee"
                options:
                    bare: true
                    sourceMap: true
        watch:
            files:
                [
                    "src/*.coffee"
                    "routes/src/*.coffee"
                ]
            tasks:
                [
                    "coffee"
                ]
    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.registerTask 'default', ['coffee', 'watch']