# == Class ftpproxy
#
class ftpproxy::service {
  service { $::ftpproxy::service_name:
    ensure    => $::ftpproxy::service_ensure,
    enable    => $::ftpproxy::service_enable,
    hasstatus => $::ftpproxy::service_hasstatus,
    require   => Class['::ftpproxy::config'];
  }
}

