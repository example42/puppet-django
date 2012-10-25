# Class: django::apache
#
# This class configures apache for django installation
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by django
#
# class django::apache inherits django {
class django::apache {

  apache::vhost { $django::web_virtualhost :
    template => $django::real_web_server_template,
    docroot  => $django::real_data_dir,
  }

}
