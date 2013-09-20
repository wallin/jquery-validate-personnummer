'use strict';

module.exports = function (grunt) {
	// load all grunt tasks
	require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

	grunt.initConfig({
		karma: {
			unit: {
				configFile: 'karma.conf.js',
				singleRun: true
			}
		},
		coffee: {
		  options: {
		  	bare: true,
		    force: true
		  },
		  dist: {
		    files: [
		      {
		        expand: true,
		        cwd: 'src',
		        src: "jquery.validate.personnummer.coffee",
		        rename: function(dest, src) {
   	        	return src.replace(/coffee$/, 'js')
		        }
		      }
		    ]
		  }
		},
		uglify: {
			dist: {
				files: {
					'jquery.validate.personnummer.min.js': 'jquery.validate.personnummer.js'
				}
			}
		}
	});

	grunt.registerTask('test', [
		'karma'
	]);

	grunt.registerTask('build', [
		'test',
		'coffee',
		'uglify'
	]);

	grunt.registerTask('default', ['build']);
};
