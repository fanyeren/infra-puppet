# for apache with multi-threaded worker MPM
# and fcgid to run PHP. Primarily for cucumber
#
# developed based on http://ubuntuforums.org/showthread.php?t=1038416
class apache2::worker {
  include apache2

  package { ['apache2-mpm-worker','libapache2-mod-fcgid'] :
    ensure => present;
  }
  package { ['apache2-mpm-prefork','libapache2-mod-php5'] :
    ensure => absent;
  }

  apache2::module { 'fcgid':
    ;
  }

  package { ['php5-cgi','php5-cli']:
    ensure => installed,
  }

  file {
    '/etc/apache2/conf.d/00-fastcgi.conf' :
      ensure  => present,
      source  => 'puppet:///modules/apache2/fastcgi.conf';
  }
}

