module.exports = (grunt)->
    grunt.initConfig
        pkg: "<json:package.json>"
        coffee:
            app:
                files:
                    "app.js": "app.coffee"
                    "db.js": "db.coffee"
                    "socket.js": "socket.coffee"
                    "routes/index.js": "routes/src/index.coffee"
                    "routes/user.js": "routes/src/user.coffee"
                    "public/javascripts/main.js": "public/javascripts/src/main.coffee"
                options:
                    bare: true
                    sourceMap: true
        watch:
            files:
                [
                    "*.coffee"
                    "routes/src/*.coffee"
                    "public/javascripts/src/*.coffee"
                ]
            tasks:
                [
                    "coffee"
                ]
    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.registerTask 'default', ['coffee', 'watch']