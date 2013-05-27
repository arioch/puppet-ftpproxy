# == Class ftpproxy::params
#
class ftpproxy::params {
  $chroot_enable            = false
  $destination_address      = '127.0.0.1'
  $destination_port         = '21'
  $destination_transfermode = 'client'
  $fork_limit               = '40'
  $listen_address           = '0.0.0.0'
  $listen_port              = 'ftp'
  $log_destination          = '/var/log/ftp-proxy/ftp-proxy.log'
  $max_clients              = '64'
  $same_address             = false
  $server_type              = 'standalone'
  $time_out                 = '900'
  $translated_address       = '0.0.0.0'

  case $::operatingsystem {
    'Debian': {
      $chroot_dir         = '/var/lib/ftp-proxy'
      $config_dir         = '/etc/proxy-suite'
      $config_dir_mode    = '0755'
      $config_file_mode   = '0644'
      $config_group       = 'root'
      $config_user        = 'root'
      $daemon_group       = 'nogroup'
      $daemon_user        = 'nobody'
      $log_dir            = '/var/log/ftp-proxy'
      $pid_file           = '/var/run/ftp-proxy.pid'
      $pkg_deps           = undef
      $pkg_ensure         = present
      $pkg_list           = [ 'ftp-proxy', 'ftp-proxy-doc' ]
      $service_dep        = undef
      $service_enable     = true
      $service_ensure     = running
      $service_hasrestart = true
      $service_hasstatus  = false
      $service_name       = 'ftp-proxy'
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported yet."
    }
  }
}

