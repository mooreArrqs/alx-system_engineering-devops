#!/usr/bin/env bash
# Using Puppet to connect to a client's server without using a pswd.

file { '/etc/ssh/ssh_config':
  ensure  => present,

content   => "

          #SSH client configuration
	  host*
	  IdentityFile ~/.ssh/school
	  PasswordAuthentication no"
}

