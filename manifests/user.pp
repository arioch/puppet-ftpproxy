# Define: ftpproxy::user
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
  $same_address              = false,
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

