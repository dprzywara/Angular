'use strict';

var gulp = require('gulp');
global.isProd = function () {
    return process.env.NODE_ENV === 'prod';
};

gulp.task('default', function () {
    
});
