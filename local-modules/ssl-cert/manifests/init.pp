#
# SSL certificate for Apache
#
class ssl-cert {
  include apache2

  # certificates
  file {
    '/etc/apache2/certificate.crt':
      source => "puppet:///modules/${module_name}/${hostname}.crt",
      notify  => Exec['reload-apache2']
      ;
    '/etc/apache2/gd_bundle.crt':
      source => "puppet:///modules/${module_name}/gd_bundle.crt",
      notify  => Exec['reload-apache2']
      ;
  }

  # /etc/apache2/server.key needs to be there, but for obvious reasons
  # that file is not managed in Puppet
}
