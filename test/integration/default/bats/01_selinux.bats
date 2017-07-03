#!/usr/bin/env bats

@test "SELinux is enabled" {
    run sh -c "sestatus | grep -i enabled"
    [ "$status" -eq 0 ]
}

@test "SELinux is enforcing" {
    run grep 'SELINUX=enforcing' /etc/selinux/config
    [ "$status" -eq 0 ]
}

@test "SELinux Docker Module enabled" {
    if [ -f /etc/fedora-release ]; then
        run sh -c "sudo semodule -l | grep docker"
        [[ "$output" =~ "docker" ]]
    elif [ -f /etc/centos-release ]; then
        run sh -c "sudo semodule -l | grep docker"
        if [[ ! "$output" =~ "Disabled" ]]; then
            status=0
        else
            status=1
        fi
    else
        echo "This system is not supported by our testing....yet"
        skip
    fi

    [ "$status" -eq 0 ]
}

@test "setroubleshoot is installed" {
    run rpm -q setroubleshoot
    [ "$status" -eq 0 ]
}


