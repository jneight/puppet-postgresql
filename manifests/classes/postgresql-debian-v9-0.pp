/*

==Class: postgresql::debian::v9-0

Parameters:
 $postgresql_data_dir:
    set the data directory path, which is used to store all the databases

Requires:
 - Class["apt::preferences"]

*/
class postgresql::debian::v9-0 {

  $version = "9.0"

  case $lsbdistcodename {
    squeeze: {

      include postgresql::debian::base

      service {"postgresql":
        ensure    => running,
        enable    => true,
        hasstatus => true,
        start     => "/etc/init.d/postgresql start ${version}",
        status    => "/etc/init.d/postgresql status ${version}",
        stop      => "/etc/init.d/postgresql stop ${version}",
        restart   => "/etc/init.d/postgresql restart ${version}",
        require   => Package["postgresql-common"],
      }

      exec { "reload postgresql ${version}":
        refreshonly => true,
        command     => "/etc/init.d/postgresql reload ${version}",
      }

    }

    default: {
      fail "${name} not available for ${operatingsystem}/${lsbdistcodename}"
    }
  }
}
