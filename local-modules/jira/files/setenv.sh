# sourced by catalina.sh upon start

# read the one shipped by Atlassian first
. /srv/jira/current/bin/setenv.sh

# Location of Java JDK.
# We set this in /etc/init.d/jira, but it turns out bin/permgen.sh was overriding this setting
# I don't know why it does that, but it even comes with a warning sign that says "DO NOT remove",
# so I'm just re-override them here
export JAVA_HOME=/usr/lib/jvm/java-6-sun
export JRE_HOME=/usr/lib/jvm/java-6-sun/jre

# insert our override directory to patch up files that's under JIRA
export CLASSPATH=/srv/jira/base/classes