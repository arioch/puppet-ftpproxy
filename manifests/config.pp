# = Class ftpproxy::config
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

  # Chroot if requested
  if $chroot_enable {
    file { $::ftpproxy::chroot_dir:
      ensure => directory,
      mode   => $::ftpproxy::config_dir_mode,
      owner  => $::ftpproxy::daemon_user,
      group  => $::ftpproxy::daemon_group,
    }
  }

  # Adjust /etc/default/ftp-proxy
  if $service_enable and $service_ensure == 'running' {
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

