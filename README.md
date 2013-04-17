# Puppet FTP-Proxy

## Requirements

* [concat module](https://github.com/ripienaar/puppet-concat)

## Tested on...

* Debian 6 (Squeeze)

## Example usage

### Install FTP-Proxy

    node /box/ {
      include ftpproxy
    }

### Adjust FTP-Proxy settings

    node /box/ {
      class { 'ftpproxy':
        listen_address = '0.0.0.0'
        listen_port    = '21'
      }
    }

### Chrooted FTP-Proxy

    node /box/ {
      class { 'ftpproxy':
        chroot_dir    = '/var/lib/ftp-proxy'
        chroot_enable = true
      }
    }

