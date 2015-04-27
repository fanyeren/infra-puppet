#
# Local configuration specific to eggplant
#
class eggplant {
  include apache2
  include apache2::functions
  include ssl-cert

  # apache configuration file
  file {
    '/etc/apache2/apache2.conf':
      source => "puppet:///modules/eggplant/apache2.conf",
      notify  => Exec['reload-apache2']
      ;
  }
}
