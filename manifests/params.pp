# Class: django::params
#
# This class defines default parameters used by the main module class django
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to django class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class django::params {

  ### WebApp specific parameters
  $install = 'package'
  $path = '/sbin:/bin:/usr/sbin:/usr/bin'
  $install_source = 'https://www.djangoproject.com/download/1.4.2/tarball/'
  $install_dirname = 'Django-1.4.2'
  $install_precommand = ''
  $install_postcommand = 'bash -c "python setup.py install "'
  $url_check = ''
  $url_pattern = 'django'
  $web_server = 'apache'
  $web_server_template = ''
  $web_virtualhost = "$::fqdn"
  $db_type = ''
  $db_host = 'localhost'
  $db_name = 'django'
  $db_user = 'django'
  $db_password = fqdn_rand(100000000000)

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'django',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $log_dir = $::operatingsystem ? {
    default => '',
  }

  $log_file = $::operatingsystem ? {
    default => '',
  }

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = ''
  $template = ''
  $options = ''
  $absent = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $puppi = false
  $puppi_helper = ''
  $debug = false
  $audit_only = false

}
