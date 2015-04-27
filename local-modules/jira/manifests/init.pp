#
# JIRA has moved to edamame and now managed via jenkins-infra/jenkins-infra
#
class jira {
  file {
  "/etc/init.d/jira":
    ensure => absent,
    ;
  }
}
