# Class: django::mysql
#
# This class configures mysql for django installation
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by django
#
class django::mysql inherits django {

  case $django::params::db_host {
    'localhost','127.0.0.1': {
      mysql::grant { "django_server_grants_${::fqdn}":
        mysql_db         => $django::db_name,
        mysql_user       => $django::db_user,
        mysql_password   => $django::db_password,
        mysql_privileges => 'ALL',
        mysql_host       => $django::db_host,
      }
    }
    default: {
      # Automanagement of Mysql grants on external servers
      # requires StoredConfigs.
      @@mysql::grant { "django_server_grants_${::fqdn}":
        mysql_db         => $django::db_name,
        mysql_user       => $django::db_user,
        mysql_password   => $django::db_password,
        mysql_privileges => 'ALL',
        mysql_host       => $::fqdn,
        tag              => "mysql_grants_${django::db_host}",
      }
    }
  }

}
