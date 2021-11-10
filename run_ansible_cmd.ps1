docker run --rm -it `
    -v $PWD/.:/ansible/playbooks `
    -v $PWD/ansible-cmd/private_keys:/private_keys `
    nrjohnstone/ansible-cmd