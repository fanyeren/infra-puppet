#
# SSL certificate for Apache
#
class ssl-cert {
  include apache2

  # certificates and apache config to let Apache recognize this file
  file {
    '/etc/apache2/certificate.crt':
      source => "puppet:///modules/${module_name}/${hostname}.crt",
      notify  => Exec['reload-apache2']
      ;
    '/etc/apache2/gd_bundle.crt':
      source => "puppet:///modules/${module_name}/gd_bundle.crt",
      notify  => Exec['reload-apache2']
      ;
    '/etc/apache2/conf.d/ssl.conf':
      source => "puppet:///modules/${module_name}/ssl.conf",
      notify  => Exec['reload-apache2']
      ;
  }

  # /etc/apache2/server.key needs to be there, but for obvious reasons
  # that file is not managed in Puppet
}
