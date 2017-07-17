# class skydive::config
class skydive::config {

  file { '/etc/skydive':
    ensure => directory,
    mode   => '0755',
  }

  $common_config_hash = {
    'host_id'                      => $::skydive::host_id,
    'ws_pong_timeout'              => $::skydive::ws_pong_timeout,
    'ws_bulk_maxmsg'               => $::skydive::ws_bulk_maxmsg,
    'ws_bulk_maxdelay'             => $::skydive::ws_bulk_maxdelay,
    'cache'                        => $::skydive::cache,
    'logging'                      => $::skydive::logging,
    'graph'                        => $::skydive::graph,
    'analyzers'                    => $::skydive::analyzers,
    'etcd'                         => $::skydive::etcd,
  }

  if defined('::skydive::agent') {
    concat {'/etc/skydive/skydive-agent.yml':
      ensure => present,
      notify => Service['skydive-agent'],
    }

    concat::fragment {'agent_common':
      target  => '/etc/skydive/skydive-agent.yml',
      order   => '10',
      content => $common_config_hash.to_yaml,
    }
  }

  if defined('::skydive::analyzer') {
    concat {'/etc/skydive/skydive-analyzer.yml':
      ensure => present,
      notify => Service['skydive-analyzer'],
    }

    concat::fragment {'analyzer_common':
      target  => '/etc/skydive/skydive-analyzer.yml',
      order   => '10',
      content => $common_config_hash.to_yaml,
    }
  }



}
