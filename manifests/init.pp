# == Class: kibana-ruby
#
# This package installs (from rpm)  and configures
# The Ruby variant of Kibana
# Assumptions
# - Kibana- Ruby is available in your repos and installs in
#   /var/vhosts/ribana/htdocs
#  - ribana because it's the rubyversion of kibana and we have the php version around too
#
#

# === Parameters
#
# Document parameters here.
#
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
#
# === Examples
#
#  class { ruby:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <github@krisbuytaert.be
#
# === Copyright
#
# Copyright 2013 Kris Buytaert, unless otherwise noted.
#
#
class kibana-ruby($elasticsearch_server ='localhost:9200') {


  package { 'kibana-ruby':
    ensure => '2-1',
  }

  package { 'kibana-bundled-deps':
    ensure => '0.98.14-1',
  }


  file { '/var/vhosts/ribana/htdocs/KibanaConfig.rb':
    ensure  => 'file',
    group   => '0',
    mode    => '644',
    owner   => '0',
    content => template('kibana-ruby/KibanaConfig.rb.erb'),
  }
}
