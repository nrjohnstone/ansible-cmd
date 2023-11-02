docker run --rm -it --privileged `
    -v $PWD/.:/ansible/playbooks `
    -v $PWD/ansible-cmd-alpine/private_keys:/private_keys `
    nrjohnstone/ansible-cmd-alpine