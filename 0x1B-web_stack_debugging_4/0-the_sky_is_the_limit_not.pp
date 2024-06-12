# Sorting out Nginx web server not to underperform.

# Increase the ULIMIT of the default file
exec { 'fix--for-nginx':
  # Modify the ULIMIT value
  command => '/bin/sed -i "s/15/4096/" /etc/default/nginx',
  # Specify the path for the sed command
  path    => '/usr/local/bin/:/bin/',
}

# Restart Nginx
exec { 'nginx-restart':
  # Restart Nginx web server
  command => '/etc/init.d/nginx restart',
  # Specify the path for the init.d script
  path    => '/etc/init.d/',
}
