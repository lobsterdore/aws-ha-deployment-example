
exec { "apt-update":
  command => "/usr/bin/apt-get update",
  refreshonly => true
}

package { [
    "golang",
    "vim",
    "build-essential",
    "git",
    "unzip"
  ]:
  ensure => 'present',
  require  => Exec['apt-update']
}


file { "/etc/profile.d/gopath.sh":
  content => "export GOPATH=/home/hello-app/go\n",
  mode => "0755"
}

user { "hello-app":
  ensure => present,
  shell => '/bin/bash'
} ->
file { "/home/hello-app":
  owner => 'hello-app',
  group => 'hello-app',
  recurse => true,
  purge => false
}
