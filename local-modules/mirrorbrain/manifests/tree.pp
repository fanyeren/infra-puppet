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


        '/srv/releases/jenkins/index.erb' :
            ensure  => present,
            source  => 'puppet:///modules/mirrorbrain/index.erb',
            notify  => Exec['generate-index']
            ;
        '/srv/releases/populate-fallback.sh':
            ensure  => present,
            mode    => 755,
            source  => 'puppet:///modules/mirrorbrain/populate-fallback.sh';
    }

    exec {
        'generate-index' :
            refreshonly => true,
            require     => File['/srv/releases/jenkins/index.erb'],
            command     => '/usr/bin/erb < index.erb > index.html',
            cwd         => '/srv/releases/jenkins'
    }
}
