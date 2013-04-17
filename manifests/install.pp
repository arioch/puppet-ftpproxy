# = Class ftpproxy::install
#
class ftpproxy::install {
  package { $::ftpproxy::pkg_list:
    ensure => $::ftpproxy::pkg_ensure,
  }

  if $::ftpproxy::pkg_deps {
    package { $::awstats::pkg_deps:
      ensure => $::awstats::pkg_ensure,
      before => Package[$::ftpproxy::pkg_list],
    }
  }
}

