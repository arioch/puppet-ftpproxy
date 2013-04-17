# = Class ftpproxy
#
class ftpproxy (
  $config_dir         = $::ftpproxy::params::config_dir,
  $config_dir_mode    = $::ftpproxy::params::config_dir_mode,
  $config_file_mode   = $::ftpproxy::params::config_file_mode,
  $config_group       = $::ftpproxy::params::config_group,
  $config_purge       = $::ftpproxy::params::config_purge,
  $config_user        = $::ftpproxy::params::config_user,
  $daemon_group       = $::ftpproxy::params::daemon_group,
  $daemon_user        = $::ftpproxy::params::daemon_user,
  $log_dir            = $::ftpproxy::params::log_dir,
  $pid_file           = $::ftpproxy::params::pid_file,
  $pkg_deps           = $::ftpproxy::params::pkg_deps,
  $pkg_ensure         = $::ftpproxy::params::pkg_ensure,
  $pkg_list           = $::ftpproxy::params::pkg_list,
  $service_enable     = $::ftpproxy::params::service_enable,
  $service_ensure     = $::ftpproxy::params::service_ensure,
  $service_hasrestart = $::ftpproxy::params::service_hasrestart,
  $service_hasstatus  = $::ftpproxy::params::service_hasstatus,
  $service_name       = $::ftpproxy::params::service_name,
) inherits ftpproxy::params {
  class { 'ftpproxy::install': } ->
  class { 'ftpproxy::config': } ~>
  class { 'ftpproxy::service': } ->
  Class['ftpproxy']
}

