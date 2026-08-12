class kubernetes_lab {
  file { '/etc/apt/keyrings':
    ensure => directory,
    mode   => '0755',
  }

  exec { 'kubernetes-repo-key':
    command => '/bin/bash -c "curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg"',
    creates => '/etc/apt/keyrings/kubernetes-apt-keyring.gpg',
    require => File['/etc/apt/keyrings'],
  }

  file { '/etc/apt/sources.list.d/kubernetes.list':
    ensure  => file,
    content => "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /\n",
    require => Exec['kubernetes-repo-key'],
  }

  exec { 'kubernetes-apt-update':
    command     => '/usr/bin/apt-get update',
    refreshonly => true,
    subscribe   => File['/etc/apt/sources.list.d/kubernetes.list'],
  }

  class { 'kubernetes':
    controller         => true,
    kubernetes_version => '1.31.0',
    container_runtime  => 'cri_containerd',
    create_repos       => false,
    require            => Exec['kubernetes-apt-update'],
  }
}
