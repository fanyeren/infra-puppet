class apache2 {
  if $operatingsystem != "Ubuntu" {
    err("The apache2 module is not configured for $operatingsystem")
  }
  else {
    package {
      'apache2' :
        ensure  => installed,
    }

    service {
      "apache2" :
        ensure   => running,
        require => Package["apache2"],
        hasstatus     => true,
        hasrestart    => true,
        enable  => true;
    }

    file {
      '/etc/apache2/conf.d/00-no-sslv3.conf' :
      ensure  => present,
      source  => 'puppet:///modules/apache2/no-sslv3.conf';
    }
  }
}
