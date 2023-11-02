docker run --rm -it --privileged `
    -v $PWD/.:/ansible/playbooks `
    -v $PWD/ansible-cmd-ubuntu/private_keys:/private_keys `
    nrjohnstone/ansible-cmd-ubuntu /bin/bash