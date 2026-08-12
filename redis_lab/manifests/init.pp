class redis_lab {
  include redis

  file { '/usr/local/bin/valkey-cli':
    ensure  => link,
    target  => '/usr/bin/redis-cli',
    require => Class['redis'],
  }
}
