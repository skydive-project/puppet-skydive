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
    }

    concat::fragment {'agent_common':
      target  => '/etc/skydive/skydive-agent.yml',
      order   => '10',
      content => inline_template("<%= ${common_config_hash}.to_yaml.gsub(/^\s{2}/, '') %>"),
    }
  }

  if defined('::skydive::analyzer') {
    concat {'/etc/skydive/skydive-analyzer.yml':
      ensure => present,
    }

    concat::fragment {'analyzer_common':
      target  => '/etc/skydive/skydive-analyzer.yml',
      order   => '10',
      content => inline_template("<%= ${common_config_hash}.to_yaml.gsub(/^\s{2}/, '') %>"),
    }
  }



}
