# == Class ftpproxy
#
class ftpproxy::service {
  service { $::ftpproxy::service_name:
    ensure     => $::ftpproxy::service_ensure,
    enable     => $::ftpproxy::service_enable,
    hasrestart => $::ftpproxy::service_hasrestart,
    hasstatus  => $::ftpproxy::service_hasstatus,
    require    => Class['::ftpproxy::config'];
  }
}

