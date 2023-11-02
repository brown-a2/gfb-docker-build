#!/bin/bash

# Custom entrypoint script for WordPress with Nginx

# Perform any custom configurations here
# For example, you can configure your database connection settings

# Start Nginx server
exec nginx -g 'daemon off;'
