# == Class ftpproxy
#
class ftpproxy (
  $chroot_dir               = $::ftpproxy::params::chroot_dir,
  $chroot_enable            = $::ftpproxy::params::chroot_enable,
  $config_dir               = $::ftpproxy::params::config_dir,
  $config_dir_mode          = $::ftpproxy::params::config_dir_mode,
  $config_file_mode         = $::ftpproxy::params::config_file_mode,
  $config_group             = $::ftpproxy::params::config_group,
  $config_purge             = $::ftpproxy::params::config_purge,
  $config_user              = $::ftpproxy::params::config_user,
  $daemon_group             = $::ftpproxy::params::daemon_group,
  $daemon_user              = $::ftpproxy::params::daemon_user,
  $destination_address      = $::ftpproxy::params::destination_address,
  $destination_port         = $::ftpproxy::params::destination_port,
  $destination_transfermode = $::ftpproxy::params::destination_transfermode,
  $fork_limit               = $::ftpproxy::params::fork_limit,
  $listen_address           = $::ftpproxy::params::listen_address,
  $listen_port              = $::ftpproxy::params::listen_port,
  $log_destination          = $::ftpproxy::params::log_destination,
  $log_dir                  = $::ftpproxy::params::log_dir,
  $max_clients              = $::ftpproxy::params::max_clients,
  $pid_file                 = $::ftpproxy::params::pid_file,
  $pkg_deps                 = $::ftpproxy::params::pkg_deps,
  $pkg_ensure               = $::ftpproxy::params::pkg_ensure,
  $pkg_list                 = $::ftpproxy::params::pkg_list,
  $same_address             = $::ftpproxy::params::same_address,
  $server_type              = $::ftpproxy::params::server_type,
  $service_enable           = $::ftpproxy::params::service_enable,
  $service_ensure           = $::ftpproxy::params::service_ensure,
  $service_hasrestart       = $::ftpproxy::params::service_hasrestart,
  $service_hasstatus        = $::ftpproxy::params::service_hasstatus,
  $service_name             = $::ftpproxy::params::service_name,
  $time_out                 = $::ftpproxy::params::time_out,
  $translated_address       = $::ftpproxy::params::translated_address,
) inherits ftpproxy::params {
  class { 'ftpproxy::install': } ->
  class { 'ftpproxy::config': } ~>
  class { 'ftpproxy::service': } ->
  Class['ftpproxy']
}

