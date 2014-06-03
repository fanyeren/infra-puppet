#
#   updates.jenkins-ci.org
#

class ci_jenkins-ci_org {
  include apache2
  include apache2::log-rotation

  apache2::virtualhost {
    'ci.jenkins-ci.org' :
    source => 'puppet:///modules/ci_jenkins-ci_org/site.conf';
  }
}
