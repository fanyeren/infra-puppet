#
# Confluence has moved to lettuce and now managed via jenkins-infra/jenkins-infra
#
class confluence {
  file {
  "/etc/init.d/confluence":
    ensure => absent,
    ;
  }
}
