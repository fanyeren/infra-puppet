class mirrorbrain::cron {
    cron {
        'ping the mirrors' :
            command => '/usr/bin/mirrorprobe',
            minute  => 30;

        'scan the mirrors' :
            command => '/usr/bin/mb scan --quiet --jobs 2 --all',
            minute  => '*/30';

        'cleanup the mirror db' :
            command => '/usr/bin/mb db vacuum',
            hour    => 1,
            minute  => 30,
            weekday => 'Monday';

        'update the Geo IP database' :
            command => '/usr/bin/geoip-lite-update',
            hour    => 4,
            minute  => 50,
            weekday => 'Monday';

        'update the time for mirror sync checks' :
            command => '/root/update_mirror_time.sh',
            minute  => 0;

      # Make sure we're using the latest mirror list before we update mirmon
        'update the mirmon mirror list' :
            command => '/usr/bin/mb export --format=mirmon > /srv/releases/mirror_list',
            minute => 40;

        'update mirmon status page' :
            command => '/usr/bin/mirmon -q -get update -c /etc/mirmon.conf',
            minute  => 45;
    }
}
