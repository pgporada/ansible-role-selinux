![pgporada.selinux](https://img.shields.io/badge/role-pgporada.selinux-yellow.svg)
[![License](https://img.shields.io/badge/license-GPLv3-brightgreen.svg)](LICENSE)

# Overview: pgporada.selinux

You should never disable selinux.

- - - -
# Example Playbook

To run the local playbook, issue the following command.

    ansible-playbook local_playbook.yml -b -K

To use this role in another playbook

    cat << EOF > some_playbook.yml
    ---
    - hosts: localhost
      connection: local
      roles:
        - pgporada.selinux
    ...
    EOF
    ansible-playbook some_playbook.yml -b -K

- - - -
# How to hack away at this role
Before submitting a PR, please create a test and run it through test-kitchen. You will need a ruby environment with gem and bundler for these tests.

    # This takes care of twiddling all the bits that need to be updated when bumping the packer version
    ./update_automagic.sh x.x.x

    # This will run your packer update through the test system
	bundle update
	bundle install
	bundle exec kitchen create
   	bundle exec kitchen converge
   	bundle exec kitchen verify
	bundle exec kitchen destroy

- - - -
# License and Author Information
GPLv3

2016 - [Phil Porada](https://philporada.com) and [Dan Rawlins](https://github.com/drrawlins)

- - - -
# Theme Song
[Andrew Jackson Jihad - Deep Dark Basement](https://www.youtube.com/watch?v=VnG47oPDeWw)
