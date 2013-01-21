# Class: django::install
#
# This class installs django
#
# == Variables
#
# Refer to django class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by django
#
class django::install inherits django {

  case $django::install {

    package: {
      package { 'django':
        ensure => $django::manage_package,
        name   => $django::package,
      }
    }

    pip: {
      package { 'django':
        ensure   => $django::manage_package,
        name     => $django::package,
        provider => 'pip',
      }
    }

    source: {
      puppi::netinstall { 'netinstall_django':
        url                 => $django::install_source,
        destination_dir     => $django::real_install_destination,
        extracted_dir       => $django::install_dirname,
        preextract_command  => $django::install_precommand,
        postextract_command => $django::install_postcommand,
        path                => $django::path,
      }
    }

    puppi: {
      puppi::project::archive { 'django':
        source                   => $django::install_source,
        deploy_root              => $django::real_install_destination,
        predeploy_customcommand  => $django::install_precommand,
        postdeploy_customcommand => $django::install_postcommand,
        report_email             => 'root',
        auto_deploy              => true,
        enable                   => true,
      }
    }

    default: { }

  }

}
