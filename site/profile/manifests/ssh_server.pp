class profile::ssh_server {
  package {'openssh-server':
    ensure => present,
  }
  service { 'sshd':
    ensure => 'running',
    enable => 'true',
  }
  ssh_authorized_key { 'root@master.puppet.vm':
    ensure => present,
    user   => 'root',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC4MS+6QDRyR6i7FGpPKLQnj6ZamEdruXCZGmsY9aUwgTvty5Ck5UsW1fStZ7foFqIg+GV36Gk6D/C5pNZ1U4JTa0nbTjlyI2lp+UigX4AEgTFbvPOPLydIjCvakFEaD6z4mAtqYHy2SuQEm75sX/O98omRWq4Jz+KQKDKDKQSOeXj7F0y+/ZBWrMQXVdTCjiQDTz5cPv+k+1ZFWx1/Jcy0Cn3B3WQNjs5kw6zcLBIKc/GtbpPopriKfxZABivqoUxdzB9Eefufm775jaP1O4QLkYPrfTHvl2ujvVDh6BByODZx/O/tB3CloQ5E1NPOzCRNAPnRqpQ9rfVwkqj6T97d',
  }
}
