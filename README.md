# README #

## Overview ##

This repository creates a docker image that can be used to run ansible playbooks interactively.

## Usage ##

Copy the private key that you desire to be used automatically for connecting to ansible hosts to the ./ansible-cmd/private_keys directory.

Run the powershell script "build.ps1" to build the nrjohnstone/ansible-cmd image.

To test, run the powershell script "run_ansible_cmd.ps1"



