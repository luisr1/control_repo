class minecraft {
  file {'/opt/minecraft/':
    ensure => directory,
  }
  file {'/opt/mminecraft/server.jar':
    ensure => file,
    source => 'https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar',    
  }
  package {'jdk-18_linux-x64_bin':
    provider => rpm,
    source   => 'https://download.oracle.com/java/18/latest/jdk-18_linux-x64_bin.rpm',
    ensure   => present,
  }
  package {'java':
    ensure => present,
  }
  file {'/opt/minecraft/eula.txt':
    ensure  => file,
    content => 'eula=true'
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
  service {'minecraft':
    ensure => running,
    enable => true,
  }
}
