#
# Configures OpenLDAP that runs on Cucumber
#
class ldap {
  # apache configuration file
  file { '/etc/default/slapd':
      source => "puppet:///modules/${module_name}/slapd.conf",
      notify  => Service['slapd']
      ;
  }
  service { 'slapd' :
      ensure        => running,
      hasrestart    => true,
      enable        => true;
  }
}
