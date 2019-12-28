## my dev env

for a fresh login you should define these variables:
```
ansible_user=your_name
host_key_checking=False
ansible_ssh_common_args='-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
```

### for localhost copy dotfiles, ensure packages are installed

`ansible-playbook local.yml`

### for remote hosts copy dotfiles, ensure packages are installed, copy pubkey

sshpass is required to copy ssh pubkey

provide inventory

`ansible-playbook -K -k remote.yml`
