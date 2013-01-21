# = Class: django
#
# This is the main django class
#
#
# == Parameters
#
# WebApp Specific params
#
# [*install*]
#   Kind of installation to attempt:
#     - package : Installs django using the OS common packages
#     - pip     : Installs django via pip
#     - source  : Installs django downloading and extracting a specific
#                 tarball or zip file
#     - puppi   : Installs django tarball or file via Puppi, creating the
#                 "puppi deploy django" command
#   Can be defined also by the variable $django_install
#
# [*path*]
#   Path variable to be used for install commands
#
# [*install_source*]
#   The URL from where to retrieve the source tarball/zip.
#   Used if install => "source" or "puppi"
#   Default is from upstream developer site. Update the version when needed.
#   Can be defined also by the variable $django_install_source
#
# [*install_destination*]
#   The base path where to extract the source tarball/zip.
#   Used if install => "source" or "puppi"
#   By default is the distro's default DocumentRoot for Web server
#   Can be defined also by the variable $django_install_destination
#
# [*install_dirname*]
#   Name of the directory created by the source tarball/zip
#   Default is based on the official sources. You hardly need to override it
#
# [*install_precommand*]
#   A custom command to execute before installing the source tarball/zip.
#   Used if install => "source" or "puppi"
#   Check django/manifests/params.pp before overriding the default settings
#   Can be defined also by the variable $django_install_precommand
#
# [*install_postcommand*]
#   A custom command to execute after installing the source tarball/zip.
#   Used if install => "source" or "puppi"
#   Check django/manifests/params.pp before overriding the default settings
#   Can be defined also by the variable $django_install_postcommand
#
# [*url_check*]
#   An url, relevant to the django application, to use for testing the
#   correct deployment of django. Used is monitor is enabled.
#   Can be defined also by the variable $django_url_check
#
# [*url_pattern*]
#   A string or regexp that must exist in the defined url_check that confirms
#   that the application is running correctly
#   Can be defined also by the variable $django_url_pattern
#
# [*web_server*]
#   The type of web server you want to preconfigure.
#   Can be defined also by the variable $django_web_server
#
# [*web_server_template*]
#   The path of the template to use for web server configuration
#   Can be defined also by the variable $django_web_server_template
#
# [*web_virtualhost*]
#   An optional virtualhost name to map to the django application
#   Can be defined also by the variable $django_web_virtualhost
#
# [*db_type*]
#   Database type to use. Default: mysql
#   Can be defined also by the variable $django_db_type
#
# [*db_name*]
#   Name of the database to create
#   Can be defined also by the variable $django_db_name
#
# [*db_host*]
#   Your database server hostname. Default: localhost
#   If you define an external db server and want to configure it
#   automatically, you need to have StoredConfigs activated.
#   Can be defined also by the variable $django_db_host
#
# [*db_user*]
#   The user django uses to connect to the database
#   Can be defined also by the variable $django_db_user
#
# [*db_password*]
#   The password used by db_user. Default is a random value
#   Can be defined also by the variable $django_db_password
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, django class will automatically "include $my_class"
#   Can be defined also by the variable $django_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, django main config file will have the param:
#   source => $source
#   Can be defined also by the variable $django_source
#
# [*source_dir*]
#   If defined, the whole django configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the variable $django_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the variable $django_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, django main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the variable $django_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the variable $django_options
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the variable $django_absent
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the variables $django_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for django checks
#   Can be defined also by the variables $django_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the variables $django_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the variables $django_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the variables $django_puppi_helper
#   and $puppi_helper
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the variables $django_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the variables $django_audit_only
#   and $audit_only
#
# Default class params - As defined in django::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of django package
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*data_dir*]
#   Path of application files
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# == Examples
#
# You can use this class in 2 ways:
# - Set variables (at top scope level on in a ENC) and "include django"
# - Call django as a parametrized class
#
# See README for details.
#
#
# == Author
#   Alessandro Franceschi <al@lab42.it/>
#
class django (
  $install             = params_lookup( 'install' ),
  $path                = params_lookup( 'path' ),
  $install_source      = params_lookup( 'install_source' ),
  $install_destination = params_lookup( 'install_destination' ),
  $install_dirname     = params_lookup( 'install_dirname' ),
  $install_precommand  = params_lookup( 'install_precommand' ),
  $install_postcommand = params_lookup( 'install_postcommand' ),
  $url_check           = params_lookup( 'url_check' ),
  $url_pattern         = params_lookup( 'url_pattern' ),
  $web_server          = params_lookup( 'web_server' ),
  $web_server_template = params_lookup( 'web_server_template' ),
  $web_virtualhost     = params_lookup( 'web_virtualhost' ),
  $db_type             = params_lookup( 'db_type' ),
  $db_name             = params_lookup( 'db_name' ),
  $db_host             = params_lookup( 'db_host' ),
  $db_user             = params_lookup( 'db_user' ),
  $db_password         = params_lookup( 'db_password' ),
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $source_dir          = params_lookup( 'source_dir' ),
  $source_dir_purge    = params_lookup( 'source_dir_purge' ),
  $template            = params_lookup( 'template' ),
  $options             = params_lookup( 'options' ),
  $absent              = params_lookup( 'absent' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $package             = params_lookup( 'package' ),
  $config_dir          = params_lookup( 'config_dir' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $config_file_init    = params_lookup( 'config_file_init' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' )
  ) inherits django::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_absent=any2bool($absent)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)

  ### Definition of some variables used in the module
  $manage_package = $django::bool_absent ? {
    true  => 'absent',
    false => 'present',
  }

  $manage_file = $django::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $django::bool_absent == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  $manage_audit = $django::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $django::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $django::source ? {
    ''        => undef,
    default   => $django::source,
  }

  $manage_file_content = $django::template ? {
    ''        => undef,
    default   => template($django::template),
  }

  ### Calculations of variables whoe value depends on different params
  $real_install_destination = $django::install_destination ? { 
    ''      => '/opt',
    default => $django::install_destination,
  }

  $real_config_file = $django::config_file ? {
    ''      => $django::install ? {
      package => $::operatingsystem ? {
        default => '/usr/lib/python2.6/site-packages/conf/global_settings.py',
      },
      default => "${django::real_install_destination}/${django::install_dirname}/conf/global_settings.py",
    },
    default => $django::config_file,
  }

  $real_config_dir = $django::config_dir ? {
    ''      => $django::install ? {
      package => $::operatingsystem ? {
        default => '/usr/lib/python2.6/site-packages/conf/',
      },
      default => "${django::real_install_destination}/${django::install_dirname}/",
    },
    default => $django::config_file,
  }

  $real_data_dir = $django::data_dir ? {
    ''      => $django::install ? {
      package => '/usr/lib/python2.6/site-packages',
      default => "${django::real_install_destination}/${django::install_dirname}",
    },
    default => $django::data_dir,
  }

  $real_web_server_template = $django::web_server_template ? {
    ''      => $django::web_server ? {
      apache  =>  'django/apache/virtualhost.conf.erb',
      nginx   =>  'django/nginx/virtualhost.conf.erb',
      default =>  undef,
    },
    default => $django::web_server_template,
  }

  ### Managed resources
  # Installation is managed in dedicated class
  require django::install

  if $django::manage_file_source 
  or $django::manage_file_content { 
    file { 'django.conf':
      ensure  => $django::manage_file,
      path    => $django::real_config_file,
      mode    => $django::config_file_mode,
      owner   => $django::config_file_owner,
      group   => $django::config_file_group,
      require => Class['django::install'],
      source  => $django::manage_file_source,
      content => $django::manage_file_content,
      replace => $django::manage_file_replace,
      audit   => $django::manage_audit,
    }
  }
 
  # The whole django configuration directory can be recursively overriden
  if $django::source_dir {
    file { 'django.dir':
      ensure  => directory,
      path    => $django::real_config_dir,
      require => Class['django::install'],
      source  => $source_dir,
      recurse => true,
      purge   => $source_dir_purge,
      replace => $django::manage_file_replace,
      audit   => $django::manage_audit,
    }
  }


  ### Include custom class if $my_class is set
  if $django::my_class {
    include $django::my_class
  }

  # Include web server configuration if requested
  case $django::web_server {
    apache: { include django::apache }
    nginx: { include django::nginx }
    default: { }
  }

  # Include database configuration, if db_type set
  case $django::db_type {
    mysql: { include django::mysql }
    default: { }
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $django::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'django':
      ensure    => $django::manage_file,
      variables => $classvars,
      helper    => $django::puppi_helper,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $django::bool_monitor == true and $django::url_check != '' {
    monitor::url { 'django_url':
      url     => $django::url_check,
      pattern => $django::url_pattern,
      target  => $django::monitor_target,
      tool    => $django::monitor_tool,
      enable  => $django::manage_monitor,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $django::bool_debug == true {
    file { 'debug_django':
      ensure  => $django::manage_file,
      path    => "${settings::vardir}/debug-django",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
    }
  }
}
