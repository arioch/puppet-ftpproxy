# == Class: ftpproxy
#
# === Parameters:
#
# $chroot_dir::               Directory where to chroot daemon.
#                             Default: operating system specific.
#
# $chroot_enable::            Enable/disable chroot.
#                             Default: false.
#
# $config_dir::               Location of the main configuration directory.
#                             Default: operating system specific.
#
# $config_dir_mode::          Posix file mode for configuration files directory.
#                             Default: 0755.
#
# $config_file_mode::         Posix file mode for configuration files.
#                             Default: 0644.
#
# $config_group::             Posix group for configuration files.
#                             Default: operating system specific.
#
# $config_purge::             Enable/disable purging unmanaged files.
#                             Default: undef.
#
# $config_user::              Posix user for configuration files.
#                             Default: operating system specific.
#
# $daemon_group::             Unprivileged group to run daemon.
#                             Default: operating system specific.
#
# $daemon_user::              Unprivileged user to run daemon.
#                             Default: operating system specific.
#
# $destination_address::      Where to redirect incoming FTP traffic.
#                             Default: 127.0.0.1.
#
# $destination_port::         Port corresponding to DestinationAddress.
#                             Default: 21.
#
# $destination_transfermode:: Specify the FTP transfer mode to be used from
#                             the proxy to the backend server.
#                             Default: client.
#
# $fork_limit::               Limits the number of incoming client
#                             connections per minute
#                             Default: 40.
#
# $listen_address::           Set to listen on a specific interface.
#                             Default: 0.0.0.0.
#
# $listen_port::              Port to listen on.
#                             Default: 21.
#
# $log_destination::          Determine where to send logging information..
#                             Default: operating system specific.
#
# $log_dir::                  Determine where to send logging information.
#                             Default: operating system specific.
#
# $max_clients::              Maximum number of concurrent clients.
#                             Default: 64.
#
# $pid_file::                 Determine where to store pid file.
#                             Default: operating system specific.
#
# $pkg_deps::                 An array containing a number of dependencies that
#                             need to be fulfilled before installing $pkg_list.
#                             Default: operating system specific.
#
# $pkg_ensure::               Default: present.
#
# $pkg_list::                 An array containing the main package and possibly
#                             a number of dependencies.
#                             Default: operating system specific.
#
# $same_address::             Allow data connections only from the same host
#                             where the control connection originated from?
#                             Default: operating system specific.
#
# $server_type::              Determine whether to run as daemon or in inetd.
#                             Default: operating system specific.
#
# $service_enable::           Enable/disable the daemon at boot time.
#                             Default: operating system specific.
#
# $service_ensure::           Ensure daemon state.
#                             Default: operating system specific.
#
# $service_hasrestart::       Specify whether or not the init script has restart.
#                             Default: operating system specific.
#
# $service_hasstatus::        Specify whether or not the init script has status.
#                             Default: operating system specific.
#
# $service_name::             Specify the name of the init script.
#                             Default: operating system specific.
#
# $time_out::                 Terminate idle connection after $time_out seconds.
#                             Default: 900.
#
# $translated_address::       Adjust if the proxy server needs to advertise
#                             itself (in outgoing responses to the ftp-server)
#                             with a different address than it actually has.
#                             Default: 0.0.0.0.
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

