#!/bin/bash
set -e

# Update cfgov-refresh dependency, if necessary
npm install

# Set up cfgov-refresh to be able to run its tasks
cd node_modules/cfgov-refresh
npm install

# Compile the on-demand CSS and JS
gulp styles:ondemand
gulp scripts:ondemand
gulp scripts:polyfill
gulp scripts:ie

# Copy the on-demand CSS/JSS into this repo's checked-in static files location
cd ../../
cp node_modules/cfgov-refresh/cfgov/static_built/css/header.css static/css/
cp node_modules/cfgov-refresh/cfgov/static_built/css/secondary-navigation.css static/css/
cp node_modules/cfgov-refresh/cfgov/static_built/css/footer.css static/css/
cp node_modules/cfgov-refresh/cfgov/static_built/js/atomic/header.js static/js/
cp node_modules/cfgov-refresh/cfgov/static_built/js/atomic/secondary-navigation.js static/js/
cp node_modules/cfgov-refresh/cfgov/static_built/js/atomic/footer.js static/js/
cp node_modules/cfgov-refresh/cfgov/static_built/js/modernizr.min.js static/js/
cp node_modules/cfgov-refresh/cfgov/static_built/js/ie/common.ie.js static/js/
