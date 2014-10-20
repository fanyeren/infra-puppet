class mirrorbrain::tree {
    file {
        # Make sure the directory tree for MirrorBrain to mirror exists
        '/srv' :
            ensure => directory;
        '/srv/releases' :
            ensure => directory;
        # Currently a symlink on cucumber to /srv/releases/hudson. Can't force this to be a directory
        # '/srv/releases/jenkins' :
        #    ensure => directory;


        '/srv/releases/jenkins/index.html' :
            ensure  => present,
            source  => 'puppet:///modules/mirrorbrain/index.html',
            require => File['/srv/releases/jenkins'];
        '/srv/releases/populate-fallback.sh':
            ensure  => present,
            mode    => 755,
            source  => 'puppet:///modules/mirrorbrain/populate-fallback.sh';
    }
}
