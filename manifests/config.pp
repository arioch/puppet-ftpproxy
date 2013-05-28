# == Class: ftpproxy::config
#
class ftpproxy::config {
  File {
    require => Class['::ftpproxy::install'],
    notify  => Service[$::ftpproxy::service_name],
    owner   => $::ftpproxy::config_user,
    group   => $::ftpproxy::config_group,
    mode    => $::ftpproxy::config_file_mode,
  }

  file {
    $::ftpproxy::config_dir:
      ensure  => directory,
      mode    => $::ftpproxy::config_dir_mode,
      purge   => $::ftpproxy::config_purge,
      recurse => $::ftpproxy::config_dir_recurse;

    $::ftpproxy::log_dir:
      ensure => directory,
      owner  => $::ftpproxy::daemon_user,
      group  => $::ftpproxy::daemon_group;
  }

  concat { "${::ftpproxy::config_dir}/ftp-proxy.conf":
    group => $::ftpproxy::config_group,
    mode  => $::ftpproxy::config_file_mode,
    owner => $::ftpproxy::config_user,
  }

  concat::fragment { 'ftpproxy.conf_header':
    target  => "${::ftpproxy::config_dir}/ftp-proxy.conf",
    content => template("ftpproxy/ftp-proxy-${::osfamily}.conf.erb"),
    order   => 01,
  }

  # Chroot if requested
  if $::ftpproxy::chroot_enable {
    file { $::ftpproxy::chroot_dir:
      ensure => directory,
      mode   => $::ftpproxy::config_dir_mode,
      owner  => $::ftpproxy::daemon_user,
      group  => $::ftpproxy::daemon_group,
    }
  }

  # Adjust /etc/default/ftp-proxy on Debian systems
  case $::operatingsystem {
    /Debian|Ubuntu/: {
      if $::ftpproxy::service_enable
      and $::ftpproxy::service_ensure == 'running' {
        augeas { 'ftpproxy RUN_DAEMON' :
          context => '/files/etc/default/ftp-proxy',
          changes => 'set RUN_DAEMON yes',
        }
      } else {
        augeas { 'ftpproxy RUN_DAEMON' :
          context => '/files/etc/default/ftp-proxy',
          changes => 'set RUN_DAEMON no',
        }
      }
    }

    default: {
    }
  }
}

