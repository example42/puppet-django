# Class: django::nginx
#
# This class configures nginx for django installation
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by django
#
class django::nginx inherits django {

  nginx::vhost { $django::web_virtualhost :
    template  => $django::real_web_server_template,
    docroot  => $django::real_data_dir,
  }

}
