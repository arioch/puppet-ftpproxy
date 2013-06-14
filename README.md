# Puppet FTP-Proxy

## Requirements

* [concat module](https://github.com/ripienaar/puppet-concat)

## Tested on...

* Debian 6 (Squeeze)
* Debian 7 (Wheezy)

## Example usage

### Install FTP-Proxy

    node /box/ {
      include ftpproxy
    }

### Adjust FTP-Proxy settings

    node /box/ {
      class { 'ftpproxy':
        listen_address => '0.0.0.0',
        listen_port    => '21',
      }
    }

### Chrooted FTP-Proxy

    node /box/ {
      class { 'ftpproxy':
        chroot_dir    => '/var/lib/ftp-proxy',
        chroot_enable => true,
      }
    }

### Add per user configuration

    ftpproxy::user { 'user1':
      ensure   => present,
      time_out => '90',
    }

    ftpproxy::user { 'user2':
      ensure       => present,
      time_out     => '90',
      same_address => true,
    }


## Unit testing

Plain RSpec:

    $ rake spec

Using bundle:

    $ bundle exec rake spec

Test against a specific Puppet or Facter version:

    $ PUPPET_VERSION=3.2.1  bundle update && bundle exec rake spec
    $ PUPPET_VERSION=2.7.19 bundle update && bundle exec rake spec
    $ FACTER_VERSION=1.6.8  bundle update && bundle exec rake spec

