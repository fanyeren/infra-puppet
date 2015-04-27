class user-danielbeck {
    group {
        "danielbeck" :
            ensure  => present;
    }

    user {
        "danielbeck" :
            gid     => "danielbeck",
            groups  => "infraadmin",
            shell   => "/bin/bash",
            home    => "/home/danielbeck",
            ensure  => present,
            require => [
                        Group["danielbeck"],
                        Group["infraadmin"],
                        ];
    }

    file {
        "/home/danielbeck" :
            ensure      => directory,
            require     => User["danielbeck"],
            owner       => "danielbeck",
            group       => "danielbeck";
        "/home/danielbeck/.ssh" :
            ensure      => directory,
            require     => File["/home/danielbeck"],
            owner       => "danielbeck",
            group       => "danielbeck";
    }

    ssh_authorized_key {
        "danielbeck_1" :
            user        => "danielbeck",
            ensure      => present,
            require     => File["/home/danielbeck/.ssh"],
            key         => "AAAAB3NzaC1yc2EAAAABIwAAAQEA6PQWKSk/5hsgq5vndqpMHisGLZXiw+pIiNF1CnOEqlgMnq/nDiHFdDX2E+SYT/LNMBEJKIhDKM8T1mOsu7voMiR5vInGGt36jPFT4qM0pLrk+RYjc5f55jk6U5qXSBoM+GqVKSw6gKWI2njMmuxwtFumGGaJuq5jFySyi6aS7Dau1+6I77YRiEnPGd3DiUCrEjKmS1NcJ4t5mrkz/n7uufMd4O8JsPtQwl8gkQT7/b2+Qx3WB42yAO06YEmsTi56X5JCRWG9lue4CIImrSmig0ILmwa4vK/hUopBqEwlpv3ar9eVcyUalo4WQac+HJ2ythWKHKvipWVvJS3ydNc0Fw==",
            type        => "rsa",
            name        => "danielbeck";
    }
}
