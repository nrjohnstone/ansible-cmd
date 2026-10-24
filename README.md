# README #

## Overview ##

This repository creates a docker image that can be used to run ansible playbooks interactively.

When the container is started, it will automatically copy any private keys mounted in the location /private_keys to the /root/.ssh and set the 
appropriate permissions on them.

## Usage ##

Make sure the container-entrypoint.sh has LF line endings for linux.

Run the powershell script "build.ps1" to build the nrjohnstone/ansible-cmd image.

Before testing make sure you have the private keys you require copied into the ansible-cmd/private_keys directory.

To test, run the powershell script "run_ansible_cmd.ps1" which will recreate the container each time.

One the container has started, check the version of ansible with the following command

```shell
ansible --version
```