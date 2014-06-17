# for apache with prefork MPM
#
# mutually exclusive with worker.pp. developed in case we need to
# back out worker
define apache2::worker_fastcgi {
  include apache2

  package { ['apache2-mpm-worker','libapache2-mod-fcgid'] :
    ensure => absent;
  }
  package { ['apache2-mpm-prefork','libapache2-mod-php5'] :
    ensure => present;
  }

  apache2::module { 'php5':
    ;
  }

  file {
    '/etc/apache2/conf.d/00-fastcgi.conf' :
      ensure  => absent,
      ;
  }
}