# == Define: ftpproxy::user
#
# === Parameters:
#
# $ensure::                     Default: present.
#
# $active_max_dataport::        Active port range highest dataport.
#                               Default: undef.
#
# $active_min_dataport::        Active port range lowest dataport.
#                               Default: undef.
#
# $destination_address::        Where to redirect incoming FTP traffic.
#                               Default: undef.
#
# $destination_max_port::       Highest (local) port range for all
#                               connections to the server.
#                               Default: undef.
#
# $destination_min_port::       Lowest (local) port range for all
#                               connections to the server.
#                               Default: undef.
#
# $destination_port::           Port corresponding to DestinationAddress.
#                               Default: 21, the standard FTP port.
#
# $destination_transfer_mode::  Specify the FTP transfer mode to be used from
#                               the proxy to the backend server.
#                               Default: undef.
#
# $passive_max_dataport::       Passive port range highest dataport.
#                               Default: undef.
#
# $passive_min_dataport::       Passive port range lowest dataport.
#                               Default: undef.
#
# $same_address::               Allow data connections only from the same host
#                               where the control connection originated from?
#                               Default: true.
#
# $time_out::                   Terminate idle connection after $time_out seconds.
#                               Default: 90.
#
# $user_name::                  Define a username for the requested user.
#
# $valid_commands::             Define a list of FTP commands that will be
#                               allowed from a client.
#                               Default: undef.
#
# $welcome_string::             Replace the standard "<host> FTP server
#                               (<version>) ready" in the initial 220 message.
#                               Default: Welcome to %h.
#
define ftpproxy::user (
  $ensure                    = present,
  $active_max_dataport       = undef,
  $active_min_dataport       = undef,
  $destination_address       = undef,
  $destination_max_port      = undef,
  $destination_min_port      = undef,
  $destination_port          = undef,
  $destination_transfer_mode = undef,
  $passive_max_dataport      = undef,
  $passive_min_dataport      = undef,
  $same_address              = true,
  $time_out                  = '90',
  $user_name                 = $name,
  $valid_commands            = undef,
) {
  concat::fragment { "ftpproxy_user_${name}":
    ensure  => $ensure,
    target  => "${ftpproxy::config_dir}/ftp-proxy.conf",
    content => template('ftpproxy/user.erb'),
    order   => 100,
  }
}

